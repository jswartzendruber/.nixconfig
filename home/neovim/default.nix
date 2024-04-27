{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs; [
      vimPlugins.nvim-lspconfig
      vimPlugins.telescope-nvim
      vimPlugins.nvim-cmp
      vimPlugins.cmp-vsnip
      vimPlugins.vim-vsnip
      vimPlugins.cmp-nvim-lsp
      vimPlugins.kanagawa-nvim
      vimPlugins.rustaceanvim
    ];
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;

}
