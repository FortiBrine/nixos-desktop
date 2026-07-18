{
  imports = [
    ./hardware-configuration.nix
    ./host/bundle.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "uk_UA.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";

}

