let
  std-groups = ["networkmanager" "audio"];
  util-groups = ["adbuser" "cdrom" "cdrw"];
  sudo-groups = ["wheel"] ++ std-groups;
in {
  arturos = {
    username = "arturos";
    description = "Arturo Salgado-Perez";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups ++ util-groups;
  };
  studyman = {
    username = "studyman";
    description = "Study Man";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups ++ util-groups;
  };
  guest = {
    username = "guest";
    description = "Guest";
    email = "guest@example.com";
    groups = std-groups;
  };
}
