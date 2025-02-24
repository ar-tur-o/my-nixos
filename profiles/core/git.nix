{host, profile, ...}: {
  programs.git = {
    enable = true;
    userEmail = profile.email;
    userName = "${profile.username}@${host.name}";
    # Git extensions and such :)
    diff-so-fancy.enable = true;
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
