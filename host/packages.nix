{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git wget vim scrcpy autossh
    gnome-terminal
    fastfetch cpufetch
    gimp
    prismlauncher
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.webstorm
    kdePackages.kdenlive
    telegram-desktop
    steam
    pciutils
    discord
    postman
    termius
    obs-studio
    flameshot
    keepassxc
    dbeaver-bin
    onlyoffice-desktopeditors
    haruna
    cpu-x
    zip unzip
    adwaita-icon-theme
    wireguard-tools
    btop
    tmux
    rclone

    python3 yt-dlp
  ];

  networking.wireguard.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
}
