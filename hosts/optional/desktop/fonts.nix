{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.myHost;
in {
  options.myHost.fonts.enable = lib.mkEnableOption "Enable extra fonts";

  config = lib.mkIf cfg.fonts.enable {
    fonts.packages = with pkgs; [
      corefonts
      vista-fonts
      noto-fonts
      roboto
      roboto-slab
      roboto-mono
      google-fonts
      nerd-fonts.jetbrains-mono
    ];
  };
}
