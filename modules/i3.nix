{ pkgs, ... }: {

  environment.pathsToLink = [ "/libexec" ];

  services.displayManager = {
    defaultSession = "none+i3";
    sddm.enable = true;
  };

  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

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

    xkb.layout = "us";
    xkb.variant = "";
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
  services.libinput.mouse.accelProfile = "flat";

  programs.dconf.enable = true;
}
