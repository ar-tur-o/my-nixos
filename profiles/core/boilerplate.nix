{profile, ...}: {
  home = {
    inherit (profile) username;
    homeDirectory = "/home/${profile.username}";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
