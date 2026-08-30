let 
  POOL_DISK_CONTENT = 
    {
      type = "gpt";
      partitions = {
        zfs = {
          size = "100%";
          content = { 
            type = "zfs";
            pool = "server-backup";
          };
        };
      };
    }; in 
{
  disko.devices = {
    zpool = {
      server-backup = {
        type = "zpool";
        mode = "mirror";
        rootFsOptions = {
          compression = "zstd";
          "com.sun:auto-snapshot" = "false";
        };
        mountpoint = "/mnt/server-backup";
      };
    };
    disk = {
      disk1 = {
        type = "disk";
        # This disk has a lot of bad sectors. It will likely fail soon 
        # (3 way mirror idc)
        device = "/dev/disk/by-id/ata-WDC_WD5000AAKS-00V1A0_WD-WMAWF1565502";
        content = POOL_DISK_CONTENT;
      };
      disk2 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-WDC_WD5000AAKS-00V1A0_WD-WMAWF1563846";
        content = POOL_DISK_CONTENT;
      };
      disk3 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-WDC_WD6400AAKS-75A7B0_WD-WMASY1352493";
        content = POOL_DISK_CONTENT;
      };
    };
  };
}
