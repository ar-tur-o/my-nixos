{pkgs, ...}: {
  # I'm using gnome as my desktop environment rn

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = [pkgs.gnome-tweaks];

  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    yelp # help viewer
    geary # email client
    seahorse # password manager
    # these should be self explanatory
    gnome-contacts
    gnome-font-viewer
    gnome-weather
    gnome-maps
    gnome-tour
  ];
}
