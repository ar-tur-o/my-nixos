{inputs, config, lib, self,...}: 
{
  imports = [inputs.playit.nixosModules.default];

  options.myHost.playit.enable = lib.mkEnableOption "Enable playit";

  config = lib.mkIf config.myHost.playit.enable {
    
  };  
}
