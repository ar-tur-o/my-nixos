{pkgs, ...}:
{
  services.rsnapshot = {
    enable = true;
    extraConfig = ''
      config_version	1.2
      snapshot_root		/mnt/server-backup/
      cmd_rsync				${pkgs.rsync}/bin/rsync
      cmd_ssh					${pkgs.openssh}/bin/ssh

      retain	daily		7
      retain	weekly	4

      backup	backup-agent@optiplex:/srv/	srv/	ssh_args=-i/home/arturos/.ssh/server-rsync-key
    '';
  };

  systemd.timers.rsnapshot-daily = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  systemd.services.rsnapshot-daily = {
    script = "${pkgs.rsnapshot}/bin/rsnapshot daily";
    serviceConfig.Type = "oneshot";
  };
}
