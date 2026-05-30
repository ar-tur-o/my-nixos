{lib, config, pkgs, myLib, ...}:
let 
  cfg = config.myHome;
  sp = myLib.simplePkgs {inherit lib cfg;} {
    hunspell = [pkgs.hunspell pkgs.hunspellDicts.en_US pkgs.hunspellDicts.es_MX];
    libreoffice = pkgs.libreoffice;
    obsidian = pkgs.obsidian;
    anki = pkgs.anki-bin;
  };
in
{
  options.myHome = {
    bundles.writing.enable = lib.mkEnableOption "Enable all writing tools";
  } // sp.options;

  config = {
    home.packages = sp.homePackages;

    myHome = sp.bundleDefaults "writing";
  };
}

