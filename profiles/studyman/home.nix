{
  imports = [
    # import programs here
    ../core
  ];

  myHome = {
    bundles = {
      media.enable = true;
      writing.enable = true;
    };

    firefox.enable = true;
    bitwarden.enable = true;
  };
}
