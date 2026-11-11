{lib, config, pkgs, ...}:
{
  options.myHost.jellyfin.enable = lib.mkEnableOption "Enables Jellyfin";

  config = lib.mkIf config.myHost.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
      ];
    };

    # turns out, I can just manage this on the cloudflare dashboard!!!!
    # Who woulda thunk?!???!?
    myHost.cloudflared = {
      enable = true;
      ingress = {"tv.computer-day.com" = "http://localhost:8096";};
    };
  };
}
