{ config, pkgs, ... }: {
  imports = [
    ./ssh.nix
  ];

  home.username = "fortibrine";
  home.homeDirectory = "/home/fortibrine";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    flameshot
  ];

  services.flameshot.enable = true;

  programs.git = {
    enable = true;

    signing = {
      key = "/home/fortibrine/.ssh/github";
      signByDefault = true;
    };

    settings = {
      user.name = "FortiBrine";
      user.email = "FortiBrine@users.noreply.github.com";
      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "BreezeDark";
      iconTheme = "breeze-dark";
    };

    shortcuts = {
      "org.kde.spectacle.desktop" = {
        "_launch" = "none";
      };
      "services/org.flameshot.Flameshot.desktop" = {
        "_launch" = "Print";
      };
    };
  };
}
