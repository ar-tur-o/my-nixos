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

    # Firefox Addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixos Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Stylix
    stylix.url = "github:danth/stylix";
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

      # this imports the HM module with all users in the host defined 
      setupHmModule = host: inputs.home-manager.nixosModules.home-manager {
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
              (user: {
                name = user;
                value = import ./users/${user}/home.nix;
              })
            ) host.users;
        };
      };

    in
    # this maps the host definition list into a host attrset
      builtins.listToAttrs (map (host: {
        name = host.hostName;
        value = let 
          # import the host config, home-manager config, and user defs
          getHostModules = host: [
            ./hosts/${host.name}/configuration.nix
            (setupHmModule host)
            ] 
            ++ map (user: ./users/${user}/user-def.nix) host.users;
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
