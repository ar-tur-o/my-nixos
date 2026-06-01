{
  inputs,
  self,
  lib,
  myLib,
  host,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options.user-profiles = {
    enable = lib.mkEnableOption "Enables user-profiles user management";
    boilerplateModules = lib.mkOption {
      description = "boilerplate modules that are imported to all profiles";
      type = lib.types.listOf lib.types.deferredModule;
      default = [];
    };
    profiles = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          description = lib.mkOption {type = lib.types.str;};
          email = lib.mkOption {type = lib.types.str;};
          groups = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
          };
          initialPassword = lib.mkOption {
            type = lib.types.str;
            default = "";
          };
        };
      });
      default = {};
    };
  };

  config = let
    hostName = config.networking.hostName;
    profiles = builtins.mapAttrs (name: value: {username = name;} // value) config.user-profiles.profiles;
  in lib.mkIf config.user-profiles.enable {
    environment.systemPackages = [pkgs.home-manager];

    home-manager = {
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit inputs host myLib;
      };
      useGlobalPkgs = true;
      useUserPackages = true;

      users =
        builtins.mapAttrs (_: profile: let
          defaultPath = "${self}/profiles/${profile.username}/home.nix";
          hostSpecificPath = "${self}/profiles/${profile.username}/${hostName}-home.nix";
        in {
          _module.args.profile = profile;
          imports = [
            (
              if (builtins.pathExists hostSpecificPath)
              then hostSpecificPath
              else defaultPath
            )
          ] ++ config.user-profiles.boilerplateModules;
        })
        profiles;
    };

    # Sets up the users
    users.users =
      builtins.mapAttrs (_: profile: {
        inherit (profile) description initialPassword;
        isNormalUser = true;
        extraGroups = profile.groups;
      })
      profiles;
  };
}
