{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    bitwarden = pkgs.bitwarden-desktop;
    insync = pkgs.insync;
    qbittorrent = pkgs.qbittorrent;
    impression = pkgs.impression;
    brasero = pkgs.brasero;
    # I had k3b here but it didn't work
  };
in
{
  options.myHome = {
    bundles.files.enable = lib.mkEnableOption "Enable file tools";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;

    myHome = sp.bundleDefaults "files";
  };
}
