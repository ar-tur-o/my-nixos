{
  pkgs,
  config,
  lib,
  ...
}: {
  options.myHost.tethering.enable = lib.mkEnableOption "Enable phone tethering";

  config =
    lib.mkIf config.myHost.tethering.enable
    {
      services.usbmuxd = {
        enable = true;
        package = pkgs.usbmuxd2;
      };

      environment.systemPackages = with pkgs; [
        libimobiledevice
        ifuse # optional, to mount using 'ifuse'
      ];
    };
}
