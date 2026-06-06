{lib, self, ...}:
  let secrets = import ../meta/secrets.nix; 
in {
  age.secrets = lib.mapAttrs (name: opts: {
    file = opts.file or "${self}/secrets/${name}.age"; 
  }) (secrets self);
}
