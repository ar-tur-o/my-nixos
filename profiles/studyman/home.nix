{lib, ...}: {
  imports = [
    # import programs here
    ../core
    ../optional/files
    ../optional/social
    ../optional/writing
    ../optional/creative
    ../optional/browsers
    # games and gamedev are excluded by default
  ];

  home = {
    username = "studyman";
    homeDirectory = lib.mkDefault "/home/studyman";
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
