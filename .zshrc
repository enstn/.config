# session workflow layout I enjoy
function t () {

  tmux new-session -s "$1" -n nvim -d
  tmux send-keys -t "$1:nvim" 'v' C-m

  tmux new-window -t "$1" -n zsh
  tmux split-window -h -t "$1:zsh"
  tmux split-window -v -t "$1:zsh.1"
  tmux send-keys -t "$1:zsh.1" 'btop' C-m

  tmux new-window -t "$1" -n coding

  tmux set-option -t "$1" -g message-style "fg=red,bold"
  tmux set-hook -t "$1" client-attached "display-message -d 2000 'Welcome back, Leo. Happy coding :)'"

  tmux attach-session -t "$1"
}
