{pkgs, lib, config, inputs, ...}:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  options.myHost.minecraft-server.enable = lib.mkEnableOption "Minecraft Server";

  config = lib.mkIf config.myHost.minecraft-server.enable {
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
    services.minecraft-servers = {
      enable = true;
      eula = true;

      servers = {
        # Arturo's Diagetic Modpack 1.0
        admp = let
          modpack = pkgs.fetchModrinthModpack {
            url = "https://github.com/ar-tur-o/admp/raw/refs/heads/main/admp-1_0_5.mrpack";
            packHash = "sha256-L6YdR8I4AvY3cqaqqeYUEM3ga400g9b68uIRsFvoM08=";
            side = "server";
          };
        in {
          enable = true;

          # We'll fill this in once you pick Fabric/Forge
          package = pkgs.neoforgeServers.neoforge-1_21_1-21_1_233;

          serverProperties = {
            server-port = 25565;
            gamemode = "survival";
            difficulty = "hard";
            max-players = 10;
            white-list = true;
            motd = "Arturo's Diagetic Modpack";
          };

          whitelist = {
            ComputerDay = "88f64f7e-d033-4561-93c7-c9dfb4636421";
          };

          operators = {
            ComputerDay = "88f64f7e-d033-4561-93c7-c9dfb4636421";
          };
          
          jvmOpts = "-Xmx14G -Xms6G -XX:+UseZGC -XX:+ZGenerational -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem";

          symlinks."mods" = pkgs.runCommand "mods-filtered" {} ''
            cp -r ${modpack}/mods $out
            chmod -R +w $out
            rm -f $out/surveyor-*.jar
            rm -f $out/connector-*.jar
            rm -f $out/noisiumed-*.jar
          '';

          files."config" = "${modpack}/config";
        };
      };
    };
    
    # Open firewall for Minecraft
    networking.firewall.allowedTCPPorts = [ 25565 ];
  };
}
