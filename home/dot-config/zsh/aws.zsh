# aws wrapper: auto sso login on expired token
aws() {
  # Capture stderr
  local tmpfile code err
  tmpfile=$(mktemp) || { command aws "$@"; return $?; }
  command aws "$@" 2>"$tmpfile"
  code=$?

  if (( code != 0 )); then
    err=$(<"$tmpfile")
    print -r -- "$err" >&2
    rm -f "$tmpfile"

    # Detect expired SSO
    if [[ "$1" != "sso" ]] && print -r -- "$err" | command grep -qE 'Token has expired|token from sso|Error when retrieving token from sso|SSO.*expired|expired.*SSO'; then
      echo "[aws] SSO expirado. Rodando aws sso login..." >&2
      command aws sso login --sso-session ebanx || return 1
      # Retry command
      command aws "$@"
      return $?
    fi
    return $code
  fi

  rm -f "$tmpfile"
  return 0
}
