{
  users.groups.media = {}; # generic media files group

  systemd.tmpfiles.rules = [
    "d /srv/media 2775 root media -"
    "d /srv/media/Music 2775 navidrome media -"
    "d /srv/media/Playlists 2775 navidrome media -"
    "d /srv/media/Books 2775 root media -"
  ];
}
