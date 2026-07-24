{
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