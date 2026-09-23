# generate a key using this command:
# > ssh-keygen -t ed25519

let 
  lib = import <nixpkgs/lib>;
  secrets = import ../meta/secrets.nix;
  in lib.mapAttrs' 
(name: value: 
  lib.nameValuePair 
    (name + ".age") 
    ({publicKeys = 
      lib.mapAttrsToList (_: o: o.publicKey) value.owners;})
) secrets
