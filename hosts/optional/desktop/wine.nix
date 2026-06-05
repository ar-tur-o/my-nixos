{pkgs, config, lib, ...}:
{
  options.myHost.wine.enable = lib.mkEnableOption "Enables wine";

  config = lib.mkIf config.myHost.wine.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
      wineWow64Packages.waylandFull
    ];
  };
}
