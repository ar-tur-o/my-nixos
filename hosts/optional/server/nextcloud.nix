{pkgs, lib, config, self, ...}:
{
  options.myHost.nextcloudServer.enable = lib.mkEnableOption "Enable Nextcloud server on this device";

  config = lib.mkIf config.myHost.nextcloudServer.enable {
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud32;
      hostName = "nextcloud.computer-day.com";
      https = true;
      datadir = "/srv/nextcloud";
      config.adminpassFile = config.age.secrets.nextcloud-admin.path;
      config.dbtype = "sqlite";
    };

    services.cloudflared = {
      enable = true;
      tunnels = {
        "656d5403-a187-42a7-a57e-f2ec3e7cfd39" = {
          credentialsFile = config.age.secrets.cloudflare-tunnel.path;
          ingress = {
            "nextcloud.computer-day.com" = "http://localhost:80";
            "immich.computer-day.com" = "http://localhost:2283";
          };
          default = "http_status:404";
        };
      };
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
