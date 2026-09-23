{
  imports = [
    # import programs here
    ../core
  ];

  myHome = {
    firefox.enable = true;

    vlc.enable = true;
    ffmpeg.enable = true;

    hunspell.enable = true;
    # add an office suite?
  };
}
