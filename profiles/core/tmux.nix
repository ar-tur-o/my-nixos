{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    extraConfig = ''set -as terminal-overrides ",xterm-256color:RGB"'';
  };
}
