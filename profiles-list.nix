let
  std-groups = ["networkmanager" "audio"];
  sudo-groups = ["wheel"] ++ std-groups;
in {
  arturos = {
    username = "arturos";
    description = "Arturo Salgado-Perez";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups;
  };
  studyman = {
    username = "studyman";
    description = "Study Man";
    email = "salgadoarturo1219@gmail.com";
    groups = sudo-groups;
  };
  guest = {
    username = "guest";
    description = "Guest";
    email = "guest@example.com";
    groups = std-groups;
  };
}
