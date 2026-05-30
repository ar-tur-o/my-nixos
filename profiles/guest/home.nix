{
  imports = [
    # import programs here
    ../core
  ];

  myHome = {
    bundles = {
      writing.enable = true;
      media.enable = true;
    };

    firefox.enable = true;
  };
}
