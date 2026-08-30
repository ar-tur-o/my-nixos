{profiles, pkgs, ...}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include the PC archetype and desktop environment
    ../core/base.nix
  ];

  myHost = {
    nextcloudServer.enable = true;
    tailscale.enable = true;
    navidrome.enable = true;
    immich.enable = true;
    cloudflared = {
      enable = true; # redundant, but whatever
      tunnelId = "656d5403-a187-42a7-a57e-f2ec3e7cfd39";
    };
  };
  
  # Enable these for minecraft server
  myHost.playit.enable = false;
  minecraft-admp = {
    enable = false; 
    packHash = "sha256-A/1stbe8o3XbhIRkEwmkBS5HBF5Zo3e+hMPMxC7mI8E=";
    version = "1_1_11s";
  };

  user-profiles = {
    enable = true;
    profiles = { inherit (profiles) arturos; };
  };

  users.users.backup-agent = {
    isSystemUser = true;
    group = "backup-agent";
    home = "/home/backup-agent";
    createHome = true;
    shell = pkgs.bash;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMMwnqnb4E8oNrFpAQUsqJKwD07a6NpN7iHhCtjxiJI arturos@arts-pc"
    ];
  };
  users.groups.backup-agent = {};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
