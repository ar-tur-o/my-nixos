{lib, host, self, ...}:
  let secrets = import ../meta/secrets.nix; 
in {
  age.secrets = lib.pipe secrets [
    (lib.filterAttrs (_: v: v.owners ? ${host.name}))     # Filter out secrets not owned by this host
    (lib.mapAttrs(name: _: {file = "${self}/secrets/${name}.age";}))  # Link the file to the secret
  ];
}
