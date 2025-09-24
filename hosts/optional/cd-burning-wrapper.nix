{ pkgs, ... }:

{
  security.wrappers.cdrecord = {
    source = "${pkgs.cdrtools}/bin/cdrecord";
    # Give it all the caps it actually checks for
    capabilities = "cap_sys_nice,cap_ipc_lock,cap_sys_resource,cap_sys_rawio=ep";
    owner = "root";
    group = "cdrom";
  };

  # If you also burn DVDs/BDs via growisofs, give it nicer scheduling too:
  security.wrappers.growisofs = {
    source = "${pkgs.dvdplusrwtools}/bin/growisofs";
    capabilities = "cap_sys_nice=ep";
    owner = "root";
    group = "cdrom";
  };
}

