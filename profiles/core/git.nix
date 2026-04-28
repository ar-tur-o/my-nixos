{
  host,
  profile,
  ...
}: {
  programs.git = {
    enable = true;
    signing.format = "openpgp";
    settings = {
      user.email = profile.email;
      user.name = "${profile.username}@${host.name}";
    };
  };
  
  # Git extensions and such :)
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };

  # To me, it makes sense to bundle github aswell
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  # this sounds cool so ima throw it in :)
  programs.gh-dash = {
    enable = true;
  };
}
