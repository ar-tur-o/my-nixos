{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Import the core desktop boilerplate
    ../core/desktop.nix
  ];

  myHost = {
    gnome.enable = true;
    fonts.enable = true;
    stylix.enable = true;
    steam.enable = true;
    sunshine.enable = true;
    roblox.enable = true;
    copyparty.enable = true;
    tethering.enable = true;
    vm.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Openrgb - specific to this pc, doesn't need a special file
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "intel";
  };
}
