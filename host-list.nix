with (import ./profiles-list.nix); [
  {
    name = "arts-pc";
    system = "x86_64-linux";
    profiles = [arturos studyman guest];
  }
  {
    name = "t480s";
    system = "x86_64-linux";
    profiles = [studyman guest];
  }
]
