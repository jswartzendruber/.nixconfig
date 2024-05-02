{ pkgs, ... }: {

  # i3 config locations
  home.file.".config/i3/config".source = ./config;
  home.file.".config/i3/wallpaper.jpg".source = ../wallpaper.jpg;

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

  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
