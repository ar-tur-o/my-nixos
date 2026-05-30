{inputs, self}: host: [
  inputs.home-manager.nixosModules.home-manager
  {
    home-manager = {
      extraSpecialArgs = {
        inherit inputs host;
        myLib.simplePkgs = import ./simplePkgs.nix;
      };
      useGlobalPkgs = true;
      useUserPackages = true;

      # this wad of code imports all the users in the users list
      # and turns it into a attr set
      users = builtins.listToAttrs (
        builtins.map
        (profile: {
          name = profile.username;
          value = let
            defaultPath = "${self}/profiles/${profile.username}/home.nix";
            hostSpecificPath = "${self}/profiles/${profile.username}/${host.name}-home.nix";
          in {
            _module.args.profile = profile;
            imports = [
              (
                if (builtins.pathExists hostSpecificPath)
                then hostSpecificPath
                else defaultPath
              )
            ];
          };
        })
        host.profiles
      );
    };
  }
]
