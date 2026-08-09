{
  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''set -as terminal-overrides ",xterm-256color:RGB"'';
  };
}
