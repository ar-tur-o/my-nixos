{
  self,
  inputs,
}: hosts:
builtins.mapAttrs (hostName: host:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
    host = host // {name = hostName;};
    profiles = import ../meta/profiles.nix;
    myLib = {
      simplePkgs = import ./simplePkgs.nix;
    };
  };
  modules = [
    "${self}/hosts/${hostName}/configuration.nix"
    ./mkProfiles.nix
    ./mkSecrets.nix
  ];
})
hosts
