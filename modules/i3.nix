{ pkgs, ... }: {

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        xidlehook
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

  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # disable mouse acceleration
  services.xserver.libinput.mouse.accelProfile = "flat";

  programs.dconf.enable = true;
}
