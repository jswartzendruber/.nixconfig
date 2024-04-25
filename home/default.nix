{ config, pkgs, ... }: {

  imports = [
    ./i3
    ./alacritty
  ];

  home = {
    username = "jason";
    homeDirectory = "/home/jason";

    packages = with pkgs; [
      # apps
      firefox

      # dev tools
      cargo
      rustc

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

  # prefer dark mode
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita-dark";
  };

  programs.git = {
    enable = true;
    userName = "jswartzendruber";
    userEmail = "jsw695538@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  programs.home-manager.enable = true;
}
