{lib, config, ...}:
{
  options.myHost.roblox.enable = lib.mkEnableOption "Enable roblox via the Sober client";

  config = lib.mkIf config.myHost.roblox.enable {
    myHost.flatpak.enable = true;

    services.flatpak.packages = ["org.vinegarhq.Sober"];
  };
}
