{ pkgs, ... }: {

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        blur = true;
      };

      font = {
        size = 12;
      };
    };
  };

}
