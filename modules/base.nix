{ pkgs, lib, ... }: {
  users.users.jason = {
    isNormalUser = true;
    description = "jason";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.steam.enable = true;

  # use bash for system shell, fish for interactive.
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
    '';
    shellAliases = {
      nd = "nix develop --command fish";
    };
  };
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # ant+ dongle
  services.udev.extraRules = ''
    # Garmin ANT+ - USB1
    ATTRS{idVendor}=="0fcf", ATTRS{idProduct}=="1004", MODE="0666"
    # Garmin ANT+ - USB2
    ATTRS{idVendor}=="0fcf", ATTRS{idProduct}=="1008", MODE="0666"
    # hLine USB2 ANT2
    ATTRS{idVendor}=="0fcf", ATTRS{idProduct}=="1009", MODE="0666"
  '';

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # weekly disk garbage collection
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Detroit";
  i18n.defaultLocale = "en_US.UTF-8";
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # enable ssh
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  environment.variables.EDITOR = "hx";

}
