{ pkgs, ... }: {

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = false;
      gdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        alacritty
        i3blocks
        i3lock
        picom
        rofi
        feh
      ];
    };

    layout = "us";
    xkbVariant = "";
  };

  # disable mouse acceleration
  services.xserver.libinput.mouse.accelProfile = "flat";

  programs.dconf.enable = true;
}
