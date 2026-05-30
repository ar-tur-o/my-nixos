{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    itch = pkgs.itch;
    minecraft = pkgs.prismlauncher;
    moonlight = pkgs.moonlight-qt;
    osu = pkgs.osu-lazer-bin;
    pcsx2 = pkgs.pcsx2;
    rpcs3 = pkgs.rpcs3;
  };
in
{
  options.myHome = {
    bundles.gaming.enable = lib.mkEnableOption "Enable gaming";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;

    myHome = sp.bundleDefaults "gaming";
  };
}
