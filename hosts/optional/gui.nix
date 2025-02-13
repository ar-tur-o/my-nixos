{pkgs, ...}: {
  # I'm using gnome as my desktop environment rn

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = [pkgs.gnome-tweaks];
}
