{profile, config, ...}: {
  home = {
    inherit (profile) username;
    homeDirectory = "/home/${profile.username}";
    stateVersion = "26.05";
  };

  xdg.userDirs = {
    enable = true;
    templates = "${config.home.homeDirectory}/Templates";
    projects = "${config.home.homeDirectory}/Projects";
  };

  programs.home-manager.enable = true;
}
