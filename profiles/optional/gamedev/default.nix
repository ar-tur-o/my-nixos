{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    godot = pkgs.godot_4;
  };
in
{
  options.myHome = {
    bundles.gamedev.enable = lib.mkEnableOption "Enable gamedev tools";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;

    myHome = sp.bundleDefaults "gamedev";
  };
}
