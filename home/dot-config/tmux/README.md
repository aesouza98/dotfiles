# tmux

Prefix padrao `C-b`. Atalhos default mantidos. Tema vem de `~/.config/themes/current/tmux.conf`.

## Arquivos

- `tmux.conf` - config unica (geral, atalhos, layout, cores), baseada em Sin-cy/dotfiles
- `tmux.conf.bak` - config anterior (local, fora do git)
- `repo-branch` - imprime `repo/branch` do diretorio do pane (nao usado na barra atual)

## Adicionado ao default

| Atalho | Acao |
|---|---|
| `prefix r` | recarrega o tmux.conf |
| `prefix ?` | cheatsheet de atalhos (popup fzf) |
| `prefix N` | nova sessao (workspace) |
| `prefix c` / `"` / `%` | janela/split no mesmo diretorio |
| `prefix W` | workmux dashboard |
| `prefix b` | workmux sidebar |
| `prefix C-t` / `C-y` / `C-g` | popup flutuante: shell / yazi / lazygit |
| `prefix v` / `\|` | copy mode / split vertical |
| `prefix g` | workmux: ultimo agente done/waiting |
| `prefix Tab` | workmux: alterna ultimo agente |

## Layout

- Uma linha embaixo (layout do Sin-cy): sessao (vermelha com prefix ativo) e zoom | abas `N: comando` (centro absoluto) | online/offline
- Cores vem de `@thm_*` em `themes/<tema>/tmux.conf` (seguem o theme-switcher)
- Icones: Nerd Font. O Ghostty usa `JetBrainsMono Nerd Font Mono` (fonte em `~/.local/share/fonts`)
- Trocar tema: `theme-switcher` (recarrega as cores sem reiniciar)

## Plugins (TPM, em `plugins/`, fora do git)

| Plugin | Atalho |
|---|---|
| tmux-resurrect | `prefix C-s` salva, `prefix C-r` restaura |
| tmux-continuum | autosave a cada 15 min, restaura ao iniciar o server |
| tmux-fzf | `prefix F` menu fzf (sessoes, janelas, panes, comandos) |
| tmux-sessionx | `prefix S` seletor de sessao com preview e zoxide |
| tmux-online-status | icone online/offline na direita (ping em www.google.com a cada refresh) |
| vim-tmux-navigator | `C-h/j/k/l` navega entre panes e nvim |

Novo clone: `prefix I` instala os plugins.
