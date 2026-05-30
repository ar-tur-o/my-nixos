{
  imports = [
    ./home.nix # import the base config
  ];

  myHome.bundles = {
    gaming.enable = true;
    gamedev.enable = true;
  };
}
