{pkgs, ...}: {
  home.packages = [
    pkgs.kdePackages.k3b
    pkgs.cdrkit
  ];
}
