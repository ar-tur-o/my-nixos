{inputs, host, ...}:
  {
   imports = [inputs.agenix.nixosModules.default];

   environment.systemPackages = [inputs.agenix.packages.${host.system}.default];
   age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key" "/home/arturos/.ssh/id_ed25519"];
  }
