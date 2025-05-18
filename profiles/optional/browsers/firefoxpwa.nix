{pkgs, ...}: {
  home.packages = [pkgs.firefoxpwa];

  programs.firefox.nativeMessagingHosts = [pkgs.firefoxpwa];
}
