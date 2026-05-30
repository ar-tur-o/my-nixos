{
  self,
  inputs,
}: hosts:
builtins.listToAttrs (map (host: {
  name = host.name;
  value = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs host;};
    modules =
      [
        "${self}/hosts/${host.name}/configuration.nix"
      ]
      ++ import ./mkProfiles.nix {inherit inputs self;} host
      ++ import ./mkUsers.nix host.profiles;
  };
})
hosts)
