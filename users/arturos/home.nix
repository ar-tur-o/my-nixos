{lib, ...}: {
  imports = [
    # import programs here
    ../core
    ../optional
  ];

  home = {
    username = "arturos";
    homeDirectory = lib.mkDefault "/home/arturos";
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
