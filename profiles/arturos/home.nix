{lib, host, ...}: {
  imports = [
    ../core
  ];

  myHome = if host.isGraphical then {
    firefox.enable = lib.mkDefault true;

    # Media (minus kid3)
    gelly.enable = lib.mkDefault true;
    ffmpeg.enable = lib.mkDefault true;
    vlc.enable = lib.mkDefault true;

    # Writing
    hunspell.enable = lib.mkDefault true;
    libreOffice.enable = lib.mkDefault true; # replace this shit
    obsidian.enable = lib.mkDefault true;
  } else {};
}
