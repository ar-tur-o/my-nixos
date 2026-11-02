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

    users.users.jellyfin.extraGroups = ["media"];
  };
}
