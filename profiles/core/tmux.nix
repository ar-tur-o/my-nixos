{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    extraConfig = ''set -as terminal-overrides ",xterm-256color:RGB"'';
  };

  programs.bash.initExtra = ''
    if [[ -z "$TMUX" ]] && [[ -n "$PS1" ]] && command -v tmux &>/dev/null; then
      exec tmux new-session -A -s main
    fi
  '';
}
