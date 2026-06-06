{lib, config, ...}:
{
  options.myHost.immich.enable = lib.mkEnableOption "Enables Immich";

  config = lib.mkIf config.myHost.immich.enable {
    services.immich = {
      enable = true;
      mediaLocation = "/srv/immich";
      port = 2283;
      openFirewall = true;
      secretsFile = config.age.secrets.immich.path;
    };

    myHost.cloudflared = {
      enable = true;
      ingress = {"immich.computer-day.com" = "http://localhost:2283";};
    };
  };
}
