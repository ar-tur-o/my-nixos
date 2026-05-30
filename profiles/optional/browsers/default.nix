{lib, config, ...}: 
let 
  cfg = config.myHome;
in
{
  imports = [
    ./firefox.nix
  ];

  options.myHome = {
    bundles.browsers.enable = lib.mkEnableOption "Enable all browsers";
  };

  config = {
    myHome = lib.mkIf cfg.bundles.browsers.enable {
      firefox.enable = lib.mkDefault true;
    };
  };
}
