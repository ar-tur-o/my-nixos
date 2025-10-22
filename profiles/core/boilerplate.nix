{profile, inputs, ...}: {
  nixpkgs.overlays = [inputs.nur.overlays.default];

  home = {
    inherit (profile) username;
    homeDirectory = "/home/${profile.username}";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
