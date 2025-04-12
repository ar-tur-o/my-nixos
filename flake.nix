{
  description = "My nixos flake.";

  inputs = {
    # official nix source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Stylix
    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      # if you are not running an unstable channel of nixpkgs, select the corresponding channel of nixvim
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    systems = [
      "x86_64-linux" # 64 bit x86
    ];
    forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
  in {
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = let
      hosts = import ./host-list.nix;

      defineProfileUser = profile: {
        users.users.${profile.username} = {
          isNormalUser = true;
          inherit (profile) description;
          extraGroups = ["wheel" "networkmanager" "audio"];
        };
      };

      # this imports the HM module with all profiles the host defined
      setupHmModule = host: [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit inputs;
              inherit host;
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
                  defaultPath = ./profiles/${profile.username}/home.nix;
                  hostSpecificPath = ./profiles/${profile.username}/${host.name}-home.nix;
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
      ];
    in
      # this maps the host definition list into a host attrset
      builtins.listToAttrs (map (host: {
          name = host.name;
          value = let
            # import the host config, home-manager config, and user defs
            getHostModules = host:
              [
                ./hosts/${host.name}/configuration.nix
              ]
              ++ (setupHmModule host)
              ++ map (profile: defineProfileUser profile) host.profiles;
          in
            inputs.nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit inputs;
                inherit host;
              };
              modules = getHostModules host;
            };
        })
        hosts);
  };
}
