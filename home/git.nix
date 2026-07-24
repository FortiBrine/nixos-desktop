{
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
}