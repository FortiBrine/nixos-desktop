{ config, pkgs, ... }: {
  imports = [
    ./ssh.nix
    ./firefox.nix
    ./git.nix
    ./plasma.nix
  ];

  home.username = "fortibrine";
  home.homeDirectory = "/home/fortibrine";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    flameshot
  ];

  services.flameshot.enable = true;
}
