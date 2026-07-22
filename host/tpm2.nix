{ pkgs, ... }:
let
  linux-id = pkgs.buildGoModule rec {
    pname = "linux-id";
    version = "0.2.3";
    src = pkgs.fetchFromGitHub {
      owner = "matejsmycka";
      repo = "linux-id";
      rev = "v${version}";
      hash = "sha256-0lO4lIga/tYzXDOGxYREr2Bgu1P6/3GH67ijivl42D8=";
    };
    vendorHash = "sha256-vmWYSlCP09cVgQa7owAZeDzGfEdMHOqQlqDuzTkRjdI=";
  };
in
{
  security.tpm2 = {
    enable = true;
    tctiEnvironment.enable = true;
    abrmd.enable = true;
  };

  boot.kernelModules = [ "uhid" "tpm_tis" "tpm_crb" ];

  users.groups.uhid = {};
  users.users.fortibrine.extraGroups = [ "tss" "uhid" ];

  services.udev.extraRules = ''
    KERNEL=="uhid", SUBSYSTEM=="misc", GROUP="uhid", MODE="0660"
  '';

  environment.systemPackages = with pkgs; [
    linux-id
    pinentry-qt
    tpm2-tools
  ];

  systemd.user.services.linux-id = {
    description = "linux-id TPM-backed FIDO2/WebAuthn authenticator";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${linux-id}/bin/linux-id";
      Restart = "on-failure";
      RestartSec = 3;
    };

    environment = {
      PINENTRY_PATH = "${pkgs.pinentry-qt}/bin/pinentry-qt";
    };
  };
}

