{pkgs, profiles, inputs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Import the core desktop boilerplate
    ../core/desktop.nix

    # This is less of a toggle and more of a structural decision
    inputs.disko.nixosModules.disko
    ./disko-server-backup.nix
    ./server-backup-service.nix
  ];

  networking.hostId = "775bb68a"; # ZFS needs a uid for the machine.
  boot.supportedFilesystems = ["zfs"];
  boot.zfs.forceImportRoot = false;
  fileSystems."/mnt/server-backup".options = ["nofail"];

  myHost = {
    gnome.enable = true;
    fonts.enable = true;
    stylix.enable = true;
    steam.enable = true;
    sunshine.enable = true;
    roblox.enable = true;
    tethering.enable = true;
    vm.enable = true;
    tailscale.enable = true;
    lessDistractionDns.enable = false;
  };

  user-profiles = {
    enable = true;
    profiles = { inherit (profiles) arturos guest; };
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
