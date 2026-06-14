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
    playit.enable = true;
    tailscale.enable = true;
    cloudflared = {
      enable = true; # redundant, but whatever
      tunnelId = "656d5403-a187-42a7-a57e-f2ec3e7cfd39";
    };
    minecraft-server.enable = true;
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
