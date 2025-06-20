{ pkgs, pkgs-unstable, ... }: {

  imports = [
    ./gnome
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
      gimp
      pkgs-unstable.zed-editor
      playerctl
      prismlauncher
      ghostty

      # language servers
      nil
      vscode-langservers-extracted

      # utils
      golden-cheetah
      mullvad-vpn
      qbittorrent
      pcmanfm
      jetbrains.idea-community-src
      vscode
      emacs
      helix
      zip
      unzip
      ripgrep
      fzf
      tree
      neofetch
      htop
      renderdoc
      scrot
      yafc-ce
      godot
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
