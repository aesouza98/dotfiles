# themes

Temas dos programas, controlados por `theme-switcher` (`~/.local/bin`).

- `<tema>/` - um diretorio por tema (catppuccin, flexoki, gruvbox, kanagawa, tokyonight)
- `current` - symlink para o tema ativo (no `.gitignore`, nao gera diff)
- `firefox-userChrome.css.tpl` - template do Firefox, renderizado com o `SWATCH` do tema

## Arquivos de cada tema

| Arquivo | Uso |
|---|---|
| `theme.conf` | `DISPLAY_NAME`, `ZELLIJ_THEME`, `SWATCH` (8 cores hex para preview e Firefox) |
| `ghostty.conf` | incluido pelo Ghostty via `config-file = ?../themes/current/ghostty.conf` |
| `nvim.lua` | carregado por `nvim/lua/colorscheme.lua` (e empurrado em instancias abertas) |
| `helix.toml` | `inherits` do tema base; `helix/themes/current.toml` aponta para ele |
| `eza.yml` | `~/.config/eza/theme.yml` e symlink para ele |
| `bat.conf` | `~/.config/bat/config` e symlink para ele |
| `starship.toml` | referencia: linha `palette`, copiada para `starship.toml` pelo apply |
| `herdr.toml` | referencia: secao `[theme]`, copiada para `herdr/config.toml` pelo apply |

## Sem include (config ainda editada pelo apply)

- Starship: linha `palette`
- Herdr: secoes `[theme]` e `[theme.custom]`
- Zellij: linhas `theme` e `theme_dark`
- Firefox: `userChrome.css` no profile (fora do repo)

## Novo clone

```
stow -t ~ -d ~/.dotfiles/home --dotfiles .   # cria ~/.config/themes
theme-switcher set catppuccin                # cria o symlink current
```

O Telescope themes do Neovim persiste a escolha em `nvim/lua/colorscheme.lua`, sobrescrevendo o `dofile` do `current`. O proximo `theme-switcher set` nao restaura esse arquivo.
