{host, ...}: {
  programs.git = {
    enable = true;
    userEmail = "salgadoarturo1219@gmail.com";
    userName = "ar-tur-o@${host.name}";
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
