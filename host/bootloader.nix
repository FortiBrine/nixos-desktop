{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."crypted" = {
    device = "/dev/disk/by-uuid/1c16fc42-b538-4aa1-a83e-f4d4cdf10712";
    allowDiscards = true;
    crypttabExtraOpts = [ "tpm2-device=auto" ];
  };
  services.fstrim.enable = true;
}
