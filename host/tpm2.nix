{ pkgs, ... }: {
  security.tpm2 = {
    enable = true;
    tctiEnvironment.enable = true;
  };

  boot.kernelModules = [ "uhid" "tpm_tis" "tpm_crb" ];

  users.groups.uhid = {};
  users.users.fortibrine.extraGroups = [ "tss" "uhid" ];

  services.udev.extraRules = ''
    KERNEL=="uhid", SUBSYSTEM=="misc", GROUP="uhid", MODE="0660"
  '';

  environment.systemPackages = with pkgs; [
    tpm-fido
    pinentry-qt
  ];

}
