{
  description = "My nixos flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";
    nur.url = "github:nix-community/NUR";
    nixvim.url = "github:nix-community/nixvim";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    copyparty.url = "github:9001/copyparty";
    playit.url = "github:pedorich-n/playit-nixos-module";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
