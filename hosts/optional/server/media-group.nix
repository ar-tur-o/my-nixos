{
  users.groups.media = {}; # generic media files group

  systemd.tmpfiles.rules = [
    "d /srv/media 2775 root media -"

    "d /srv/media/Music 2775 root media -"
    "d /srv/media/Books 2775 root media -"
    "d /srv/media/Manga 2775 root media -"
    "d /srv/media/Comics 2775 root media - -"
    "d /srv/media/Light\ Novels 2775 root media - -"
    "d /srv/media/Movies 2775 root media - -"
    "d /srv/media/Shows 2775 root media - -"
  ];
}
