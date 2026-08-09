{pkgs, lib, config, self, ...}:
{
  options.myHost.nextcloudServer.enable = lib.mkEnableOption "Enable Nextcloud server on this device";

  config = lib.mkIf config.myHost.nextcloudServer.enable {
    services.postgresql = {
      enable = true;
      ensureDatabases = [ "nextcloud" ];
      ensureUsers = [
        {
          name = "nextcloud";
          ensureDBOwnership = true;
        }
      ];
    };

    services.nextcloud = {
      enable = true;
      https = false;
      database.createLocally = true;
      configureRedis = true;
      package = pkgs.nextcloud33;
      hostName = "nextcloud.computer-day.com";
      datadir = "/srv/nextcloud";
      settings = {
        trusted_domains = [
          "100.120.74.126" # tailscale ip
          "optiplex"
        ];
        trusted_proxies = ["127.0.0.1"];
      };
      config = {
        adminpassFile = config.age.secrets.nextcloud-admin.path;
        dbtype = "pgsql";
        dbname = "nextcloud";
        dbuser = "nextcloud";
        dbhost = "/run/postgresql";
      };
      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) contacts calendar tasks;
      };
    };

    myHost.cloudflared = {
      enable = true;
      ingress = {"nextcloud.computer-day.com" = "http://localhost:80";};
    };

    networking.firewall.allowedTCPPorts = [80 443];

    users.users.nextcloud.extraGroups = ["media"];
  };
}
