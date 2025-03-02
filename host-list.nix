with (import ./profiles-list.nix); [
  {
    name = "arts-pc";
    system = "x86_64-linux";
    profiles = [arturos studyman];
  }
  {
    name = "t480s";
    system = "x86_64-linux";
    profiles = [studyman];
  }
]
