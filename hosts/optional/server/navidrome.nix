{lib, config, pkgs, ...}:
{
  options.myHost.navidrome.enable = lib.mkEnableOption "Enables Navidrome";

  config = lib.mkIf config.myHost.navidrome.enable {
    services.navidrome = {
      enable = true;
      openFirewall = true;
      settings = {
        MusicFolder = "/mnt/media/music";
        PlaylistsPath = "/mnt/media/playlists";
        Address = "0.0.0.0";
        Port = 4533;
        Scanner.GroupAlbumReleases = true;
      };
      plugins = with pkgs.navidromePlugins; [
        apple-music
        listenbrainz-daily-playlist
      ];

    };

    myHost.cloudflared = {
      enable = true;
      ingress = {"music.computer-day.com" = "http://localhost:4533";};
    };

    users.users.navidrome.extraGroups = ["media"];
  };
}
