{lib, config, ...}:
{
  options.myHost.slskd.enable = lib.mkEnableOption "Enables SoulSeek daemon service";

  config = lib.mkIf config.myHost.slskd.enable {
    services.slskd.enable = true;
    services.slskd.environmentFile = config.age.secrets.slsk.path;
    services.slskd.settings = {
      shares.directories = ["/srv/media/Music"];
      soulseek = {
        listen_ip_address = "10.77.0.2";
        listen_port = 50300;
      };
    };

    networking.firewall.allowedTCPPorts = [5030];

    myHost.cloudflared = {
      enable = true;
      ingress = {"slsk.computer-day.com" = "https://localhost:5030";};
    };
  };
}
