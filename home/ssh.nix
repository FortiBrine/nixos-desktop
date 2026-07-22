{
  services.ssh-tpm-agent = {
    enable = true;
    extraArgs = [
      "--no-cache"
    ];
  };

  systemd.user.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-tpm-agent.sock";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };

      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };

      "gitlab.com" = {
        user = "git";
        hostname = "gitlab.com";
        identityFile = "~/.ssh/gitlab";
        identitiesOnly = true;
      };
    };
  };
}
