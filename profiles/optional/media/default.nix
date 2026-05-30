{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    elisa = pkgs.kdePackages.elisa;
    ffmpeg = pkgs.ffmpeg-full;
    kid3 = pkgs.kid3;
    picard = pkgs.picard;
    vlc = pkgs.vlc;
  };
in
{
  options.myHome = {
    bundles.media.enable = lib.mkEnableOption "Enable media tools";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;

    myHome = sp.bundleDefaults "media";
  };
}
