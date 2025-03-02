{pkgs, ...}: {
  # battery life monitoring
  environment.systemPackages = [pkgs.powertop];

  # tlp power management service
  services.tlp.enable = true;

  # this is the default power management system that comes with gnome
  services.power-profiles-daemon.enable = false;
}
