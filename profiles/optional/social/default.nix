{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    discord = pkgs.discord;
  };
in
{
  options.myHome = {
    bundles.social.enable = lib.mkEnableOption "Enable all social programs";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;
    
    myHome = sp.bundleDefaults "social";
  };
}
