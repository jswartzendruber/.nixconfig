{ config, pkgs, ... }:

{
  home.username = "jason";
  home.homeDirectory = "/home/jason";

  home.packages = with pkgs; [
    neofetch

    # utils
    zip
    unzip

    # tools
    neovim
    ripgrep
    fzf
    tree
    htop
  ];

  programs.git = {
    enable = true;
    userName = "jswartzendruber";
    userEmail = "jsw695538@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
