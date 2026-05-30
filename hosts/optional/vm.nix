{
  pkgs,
  config,
  lib,
  ...
}: {
  options.myHost.vm.enable = lib.mkEnableOption "Enable virtualisation";

  config =
    lib.mkIf config.myHost.vm.enable
    {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
          vhostUserPackages = [pkgs.virtiofsd];
        };
      };

      virtualisation.spiceUSBRedirection.enable = true;

      programs.virt-manager.enable = true;
    };
}
