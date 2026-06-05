{pkgs, lib, config, self, ...}:
{
  options.myHost.nextcloudServer.enable = lib.mkEnableOption "Enable Nextcloud server on this device";

  config = lib.mkIf config.myHost.nextcloudServer.enable {
    age.secrets.nextcloud-admin.file = "${self}/secrets/nextcloud-admin.age";

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud32;
      hostName = "10.0.0.213";
      config.adminpassFile = config.age.secrets.nextcloud-admin.path;
      config.dbtype = "sqlite";
    };

    networking.firewall.allowedTCPPorts = [80];
  };
}
