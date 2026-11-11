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

    # Wait up for the wireguard VPN
    systemd.services.slskd = {
      after = ["wg-quick-wg0.service"];
      requires = ["wg-quick-wg0.service"];
    };

    # slskd needs permission to write to it's var folder
    systemd.services.slskd.environment.HOME = "/var/lib/slskd";

    networking.firewall.allowedTCPPorts = [5030];

    myHost.cloudflared = {
      enable = true;
      ingress = {"slsk.computer-day.com" = "https://localhost:5030";};
    };
  };
}
