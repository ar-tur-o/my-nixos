{pkgs, ...}: {
  # I'm using gnome as my desktop environment rn

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  environment.systemPackages = [pkgs.gnome-tweaks];
  qt.platformTheme = "gnome";

  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    yelp # help viewer
    geary # email client
    seahorse # password manager
    totem # "gnome videos" - A video player
    # these should be self explanatory
    gnome-contacts
    gnome-font-viewer
    gnome-weather
    gnome-maps
    gnome-tour
    gnome-music
  ];
}
