{
  imports = [
    # import programs here
    ../core
  ];

  myHome = {
    bundles = {
      browsers.enable = true;
      creative.enable = true;
      files.enable = true;
      # games and gamedev are excluded by default
      media.enable = true;
      social.enable = true;
      writing.enable = true;
    };
  };
}
