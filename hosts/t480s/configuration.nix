{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include the PC archetype and desktop environment
    ../core
    ../optional/gnome.nix
    ../optional/stylix.nix

    # battery life module
    ../optional/battery-life.nix
    
    # Permissions for programs that burn CD's
    ../optional/cd-burning-wrapper.nix

    ../optional/tethering.nix
  ];

  programs.adb.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
