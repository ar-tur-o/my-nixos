{
  imports = [
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./browsh.nix
    ./boilerplate.nix # this isn't a program, it just sets important attrs
    ./btop.nix

    ../optional # Imports all the optional program... options
  ];

  services.mpris-proxy.enable = true;
}
