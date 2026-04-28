{profile, ...}: {
  home = {
    inherit (profile) username;
    homeDirectory = "/home/${profile.username}";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
