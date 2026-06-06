{inputs, config, lib, ...}: 
{
  imports = [inputs.playit.nixosModules.default];

  options.myHost.playit.enable = lib.mkEnableOption "Enable playit";

  config = lib.mkIf config.myHost.playit.enable {
    services.playit = {
      enable = true;
      secretPath = config.age.secrets.playit.path;
    };
  };
}
