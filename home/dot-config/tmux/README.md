# tmux

Prefix padrao `C-b`. Atalhos default mantidos. Tema vem de `~/.config/themes/current/tmux.conf`.

## Arquivos

- `tmux.conf` - config unica (geral, atalhos, layout, cores)
- `repo-branch` - imprime `repo/branch` do diretorio do pane (status-right)

## Adicionado ao default

| Atalho | Acao |
|---|---|
| `prefix r` | recarrega o tmux.conf |
| `prefix ?` | cheatsheet de atalhos (popup fzf) |
| `prefix N` | nova sessao (workspace) |
| `prefix c` / `"` / `%` | janela/split no mesmo diretorio |
| `prefix W` | workmux dashboard |
| `prefix C-t` | workmux sidebar |
| `prefix g` | workmux: ultimo agente done/waiting |
| `prefix Tab` | workmux: alterna ultimo agente |

## Layout

- Uma linha embaixo: sessao + flags (PREFIX/COPY/ZOOM) | abas `N` ou `N. nome` + icone workmux | repo/branch, hora BRT, hora UTC, data
- Trocar tema: `theme-switcher` (recarrega as cores sem reiniciar)

## Plugins (TPM, em `plugins/`, fora do git)

| Plugin | Atalho |
|---|---|
| tmux-resurrect | `prefix C-s` salva, `prefix C-r` restaura |
| tmux-continuum | autosave a cada 15 min, restaura ao iniciar o server |
| tmux-fzf | `prefix F` menu fzf (sessoes, janelas, panes, comandos) |
| tmux-sessionx | `prefix S` seletor de sessao com preview e zoxide |

Novo clone: `prefix I` instala os plugins.
