# generate a key using this command:
# ssh-keygen -t ed25519
# 
# Encrypt:
# agenix -e my-secret.age
#
# Decrypt:
# agenix -d my-secret.age -i /etc/ssh/ssh_host_ed25519_key 


let
  hosts = import ./hosts.nix;
in {
  nextcloud-admin.owners = {inherit (hosts) optiplex;};
  cloudflare-tunnel.owners = {inherit (hosts) optiplex;};
  immich.owners = {inherit (hosts) optiplex;};
  playit.owners = {inherit (hosts) optiplex;};
  tailscale.owners = {inherit (hosts) optiplex arts-pc;};
  server-rsync.owners = {inherit (hosts) arts-pc;};
  slsk.owners = {inherit (hosts) optiplex;};
}
