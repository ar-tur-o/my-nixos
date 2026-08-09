{
  users.groups.media = {}; # generic media files group

  systemd.tmpfiles.rules = [
    "d /mnt/media 2775 root media -"
    "d /mnt/media/music 2775 navidrome media -"
    "d /mnt/media/playlists 2775 navidrome media -"
    "d /mnt/media/photos 2775 immich media -"
  ];
}
