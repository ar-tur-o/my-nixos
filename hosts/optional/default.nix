{
  imports = [
    ./flatpak.nix
    ./tethering.nix
    ./battery-life.nix
    ./cd-burning-wrapper.nix
    ./tailscale.nix

    ./gaming
    ./server
    ./desktop
  ];
}
