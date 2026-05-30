{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.myHost;
in {
  options.myHost.batteryLife.enable = lib.mkEnableOption "Enable battery life changes. Only useful on laptops";

  config = lib.mkIf cfg.batteryLife.enable {
    # battery life monitoring
    environment.systemPackages = [pkgs.powertop];

    # tlp power management service
    services.tlp.enable = true;

    # this is the default power management system that comes with gnome
    services.power-profiles-daemon.enable = false;
  };
}
