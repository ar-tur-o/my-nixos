{lib, config, pkgs, myLib, ... }:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    blender = pkgs.blender;
    freecad = pkgs.freecad;
    inkscape = pkgs.inkscape;
    krita = pkgs.krita;
    orcaSlicer = pkgs.orca-slicer;
  };
in
{
  options.myHome = {
    bundles.creative.enable = lib.mkEnableOption "Enable all creative apps";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;
    myHome = sp.bundleDefaults "creative";
  };
}

