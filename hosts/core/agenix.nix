{inputs, host, ...}:
  {
   imports = [inputs.agenix.nixosModules.default];

   environment.systemPackages = [inputs.agenix.packages.${host.system}.default];
  }
