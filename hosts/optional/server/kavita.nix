{lib, config, pkgs, ...}:
{
  options.myHost.kavita.enable = lib.mkEnableOption "Enables Kavita";

  config = lib.mkIf config.myHost.kavita.enable {
    services.kavita = {
      enable = true;
      settings = {
        Port = 5000;
        IpAddresses = "0.0.0.0";
        TokenKey = "@token_key@";
      };
      credentials = {
        token_key = config.age.secrets.kavita.path;
      };
    };

    networking.firewall.allowedTCPPorts = [5000];
  };
}
