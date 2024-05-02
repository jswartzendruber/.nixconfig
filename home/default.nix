{ pkgs, ... }: {

  imports = [
    ./i3
    ./neovim
    ./alacritty
  ];

  home = {
    username = "jason";
    homeDirectory = "/home/jason";

    packages = with pkgs; [
      # apps
      firefox
      chromium
      spotify
      obs-studio
      vlc
      steam

      # language servers
      nil

      # utils
      helix
      zip
      unzip
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
