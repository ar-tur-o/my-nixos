{profiles, ...}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include the PC archetype and desktop environment
    ../core/base.nix
  ];

  myHost = {
    stylix.enable = true;
    nextcloudServer.enable = true;
    immich.enable = false; # Immich is redundant b/c photos here are just backed up, not browsed
  };

  user-profiles = {
    enable = true;
    profiles = { inherit (profiles) arturos; };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
