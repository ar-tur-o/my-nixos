{
  lib,
  config,
  ...
}:
let cfg = config.myHost; in
{
  options.myHost.steam = {
    enable = lib.mkEnableOption "Enable the Steam Launcher";
  };

  config = lib.mkIf cfg.steam.enable
{
  programs.steam.enable = true;
};
}
