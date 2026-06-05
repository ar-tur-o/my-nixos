let 
  # generate a key using this command:
  # > ssh-keygen -t ed25519
  optiplex = {
    arturos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICjxxOnhHTKch2L4THT4bnTQ1+HK2d1KKhdsG7P6IRdM";
  };
  in {
  # example
  "api/key.age".publicKeys = [optiplex.arturos];
}
