{ config, pkgs, ... }:

{
  home = {
  username = "jason";
  homeDirectory = "/home/jason";

  packages = with pkgs; [
      # utils
      zip
      unzip
      neovim
      ripgrep
      fzf
      tree
      neofetch
      htop
    ];

    stateVersion = "23.11";
  };

  programs.git = {
    enable = true;
    userName = "jswartzendruber";
    userEmail = "jsw695538@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  programs.home-manager.enable = true;
}
