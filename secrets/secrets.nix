let 
  # generate a key using this command:
  # > ssh-keygen -t ed25519
  optiplex = {
    pub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAuSaFQO8SDTChpK+KIhoix+BNV1lQyN4m6BSXm7ePkZ"; 
    arturos.pub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICjxxOnhHTKch2L4THT4bnTQ1+HK2d1KKhdsG7P6IRdM";
  };
  in {
  # example
  "api/key.age".publicKeys = [optiplex.arturos.pub];
  "nextcloud-admin.age".publicKeys = [optiplex.pub];
  "cloudflare-tunnel.age".publicKeys = [optiplex.pub];
  "immich.age".publicKeys = [optiplex.pub];
}
