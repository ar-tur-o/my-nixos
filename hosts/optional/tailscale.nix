{config, lib, ...}:
{
  options.myHost.tailscale.enable = lib.mkEnableOption "enable tailscale";

  config = lib.mkIf config.myHost.tailscale.enable {
    services.tailscale = {
      enable = true;
      authKeyFile = config.age.secrets.tailscale.path;
    };  

    networking.firewall.trustedInterfaces = [ "tailscale0" ];  
  };
}
