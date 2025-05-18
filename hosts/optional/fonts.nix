{pkgs, ...}: {
  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    noto-fonts
    roboto
    roboto-slab
    roboto-mono
    google-fonts
  ];
}
