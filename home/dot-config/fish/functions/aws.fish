function aws
    set -l tmpfile (mktemp /tmp/aws-stderr-XXXXXX)
    command aws $argv 2>$tmpfile
    set -l code $status

    if test $code -ne 0
        set -l err (cat $tmpfile)
        cat $tmpfile >&2

        if string match -qr 'Token has expired|token from sso|Error when retrieving token from sso|SSO.*expired|expired.*SSO' -- $err
            echo "[aws] SSO expirado. Rodando aws sso login..." >&2
            rm -f $tmpfile
            command aws sso login --sso-session ebanx
            or begin
                rm -f $tmpfile
                return 1
            end
            command aws $argv
            set code $status
            rm -f $tmpfile
            return $code
        end
    end

    rm -f $tmpfile
    return $code
end
