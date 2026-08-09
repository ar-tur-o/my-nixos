{lib, config, ...}:
{
  options.myHost.immich.enable = lib.mkEnableOption "Enables Immich";

  config = lib.mkIf config.myHost.immich.enable {
    services.immich = {
      enable = true;
      mediaLocation = "/srv/immich";
      host = "0.0.0.0";
      port = 2283;
      openFirewall = true;
      secretsFile = config.age.secrets.immich.path;
    };
    
    networking.firewall.allowedTCPPorts = [2283];

    myHost.cloudflared = {
      enable = true;
      ingress = {"immich.computer-day.com" = "http://localhost:2283";};
    };
  };
}
