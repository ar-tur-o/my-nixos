let 
  # generate a key using this command:
  # > ssh-keygen -t ed25519
  optiplex = {
    pub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAuSaFQO8SDTChpK+KIhoix+BNV1lQyN4m6BSXm7ePkZ"; 
  };

  arts-pc = {
    pub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIz/ya6TFHpUagr7WoGYgK5ny53lVsrhLyPEd6G0y0IL";
  };

  in {
  # example
  "nextcloud-admin.age".publicKeys = [optiplex.pub];
  "cloudflare-tunnel.age".publicKeys = [optiplex.pub];
  "immich.age".publicKeys = [optiplex.pub];
  "playit.age".publicKeys = [optiplex.pub];
  "tailscale.age".publicKeys = [optiplex.pub arts-pc.pub];
}
