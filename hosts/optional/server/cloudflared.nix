{lib, config, ...}:
{
  options.myHost.cloudflared = {
    enable = lib.mkEnableOption "Enable cloudflared on this device";
    tunnelId = lib.mkOption {
      type = lib.types.str;
    };
    ingress = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
    };
  };

  config = lib.mkIf config.myHost.cloudflared.enable {
    services.cloudflared = {
      enable = true;
      tunnels = {
        "${config.myHost.cloudflared.tunnelId}" = {
          credentialsFile = config.age.secrets.cloudflare-tunnel.path;
          ingress = config.myHost.cloudflared.ingress;
          default = "http_status:404";
        };
      };
    };
  };
}
