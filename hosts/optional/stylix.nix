{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.myHost.stylix = {
    enable = lib.mkEnableOption "Enable Stylix";
  };

  config =
    lib.mkIf config.myHost.stylix.enable
    {

      # scilence some warnings
      #gtk.gtk4.theme = null;

      stylix = {
        enable = true;
        autoEnable = true; # this shit doesn't want to play nice

        # This is the full list of themes
        # https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
        base16Scheme = let
          fileName = "catppuccin-frappe.yaml";
        in "${pkgs.base16-schemes}/share/themes/${fileName}";

        polarity = "dark";

        opacity = {
          terminal = 0.70;
          popups = 0.90;
        };

        image = ../../wallpaper.png;

        cursor = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
          size = 20;
        };
      };
    };
}
