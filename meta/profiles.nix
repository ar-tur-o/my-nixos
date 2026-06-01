let
  std-groups = ["networkmanager" "audio" "adbuser" "cdrom" "cdrw"];
  sudo-groups = ["wheel" "libvirtd"] ++ std-groups;
in {
  arturos = {
    description = "Arturo Salgado-Perez";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups;
  };
  studyman = {
    description = "Study Man";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups;
  };
  guest = {
    description = "Guest";
    email = "guest@example.com";
    groups = std-groups;
    initialPassword = "";
  };
}
