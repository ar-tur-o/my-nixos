{
  description = "My nixos flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    copyparty.url = "github:9001/copyparty";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = let
      mkHosts = import ./lib/mkHosts.nix {inherit self inputs;};
      hosts = import ./meta/hosts.nix;
    in
      mkHosts hosts;
  };
}
