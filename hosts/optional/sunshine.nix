{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.myHost;
in {
  options.myHost.sunshine.enable = lib.mkEnableOption "Enables sunshine hosting";

  config =
    lib.mkIf cfg.sunshine.enable
    {
      environment.systemPackages = with pkgs; [
        sunshine
      ];

      # this stuff is just for sunshine hosting now
      security.wrappers.sunshine = {
        owner = "root";
        group = "root";
        capabilities = "cap_sys_admin+p";
        source = "${pkgs.sunshine}/bin/sunshine";
      };

      # autodiscovery to connect from a local network
      services.avahi.publish.enable = true;
      services.avahi.publish.userServices = true;

      networking.firewall = {
        enable = true;
        allowedTCPPorts = [47984 47989 47990 48010];
        allowedUDPPortRanges = [
          {
            from = 47998;
            to = 48000;
          }
        ];
      };
    };
}
