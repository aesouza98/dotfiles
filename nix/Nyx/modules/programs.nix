{ config, pkgs, ... }:

{
  # ZSH
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  # hyprland + uwsm
  programs.hyprland = {
    enable = true;
	  withUWSM = true;
	  xwayland.enable = true;
  };

  # UWSM
  programs.uwsm.enable = true;

  # Steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # Git Configs
  programs.git = {
    enable = true;
    settings = {
      alias = {
        st = "status";
        # lg = "log --oneline --graph --decorate";
        c = "commit -m";
        lg = "log --color --graph --branches --all --decorate --oneline";
        chb = "checkout -b";
        ch = "checkout";
      };
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  # Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    # enable language providers
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    # Add Nix-managed plugins that LazyVim depends on
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      telescope-nvim
      plenary-nvim
    ];
  };
}
