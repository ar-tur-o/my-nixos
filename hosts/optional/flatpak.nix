{config, lib, inputs, ...}: 
{
  imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

  options.myHost.flatpak.enable = lib.mkEnableOption "Enable Flatpak";

  config = lib.mkIf config.myHost.flatpak.enable {
    services.flatpak = {
      enable = true;
    };
  };
}
