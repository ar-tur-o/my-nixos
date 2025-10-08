{pkgs, inputs, ...}: 
{
  imports = [inputs.copyparty.nixosModules.default];

  nixpkgs.overlays = [inputs.copyparty.overlays.default];
  
  environment.systemPackages = [
    pkgs.copyparty
    pkgs.cloudflared # ill figure this out later
  ];

  services.copyparty = {
    enable = true;
    user = "copyparty";
    group = "copyparty";
    
    accounts = {};

    groups = {};

    volumes = {
      "/" = {
        path = "/srv/copyparty";

        access = {
          r = "*";
          # rw = []; # ill figure out users later
        };

        flags = {
          scan = 120; # scan every 2 min
        };
      };
    };
  };
}
