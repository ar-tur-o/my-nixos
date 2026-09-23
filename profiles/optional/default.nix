{lib, config, pkgs, host, inputs, ...}: let 
  simplePkgsDefs = {
    # Creative
    blender = pkgs.blender;
    krita = pkgs.krita;
    
    # Maker
    freeCad = pkgs.freecad;
    orcaSlicer = pkgs.orcaSlicer;
    
    # Files
    impression = pkgs.impression;
    brasero = pkgs.brasero;

    # Gamedev
    godot = pkgs.godot_4;

    # Gaming
    itch = pkgs.itch;
    minecraft = [
    (inputs.prismlauncher.packages.${host.system}.prismlauncher.override {
        controllerSupport = true;
        gamemodeSupport = true; })
    ];
    moonlight = pkgs.moonlight-qt;
    osu = pkgs.osu-lazer-bin;

    # Media
    gelly = pkgs.gelly;
    ffmpeg = pkgs.ffmpeg-full;
    kid3 = pkgs.kid3;
    vlc = pkgs.vlc;

    # Social
    discord = pkgs.discord;

    # Writing
    hunspell = [pkgs.hunspell pkgs.hunspellDicts.en_US pkgs.hunspellDicts.es_MX];
    libreOffice = pkgs.libreoffice; # replace this w/ something better
    obsidian = pkgs.obsidian;
  };

  # Makes all the enable options based on simple package definitions
  simplePkgsOpts = lib.mapAttrs (name: _: 
    {enable = lib.mkEnableOption ("Enable " + name);}
  ) simplePkgsDefs;

  # Pass in the config option to make a list with all the enabled packages
  simplePkgs = cfg: 
    lib.pipe simplePkgsDefs [
      (lib.filterAttrs (name: _: cfg.myHome.${name}.enable)) # filters out the disabled packages
      (lib.mapAttrsToList (_: value: lib.toList value))       # makes this -> [[pkg1] [pkg2 pkg3] ...]
      (lib.flatten)                                           # flattens into this -> [pkg1 pkg2 pkg3 ...]
    ];
in
{
  imports = [
    ./firefox.nix
  ];

  options.myHome = simplePkgsOpts;

  config = {
    home.packages = simplePkgs config;
  };
}
