{
  imports = [
    ./home.nix # import the base config
  ];

  myHome = {
    firefox.enable = true;
    
    blender.enable = true;
    krita.enable = true;
    
    freeCad.enable = true;
    orcaSlicer.enable = true;
    
    impression.enable = true;
    brasero.enable = true;

    godot.enable = true; 

    itch.enable = true;
    minecraft.enable = true;
    moonlight.enable = true;
    osu.enable = true;

    kid3.enable = true;

    discord.enable = true;

  };
}
