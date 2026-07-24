{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox_esr;

    languagePacks = [ "uk" ];

    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      Preferences = {
        "network.trr.mode" = 3;
        "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
      };

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*" = {
          installation_mode = "blocked";
        };

        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };

        "addon@darkreader.org" = {
          install_url       = moz "darkreader";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };

        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url       = moz "privacy-badger17";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };
      };

      "3rdparty".Extensions = {
        "addon@darkreader.org" = {
          disabledFor = [
            "lidraughts.org"
          ];
        };
      };
    };

  };
}