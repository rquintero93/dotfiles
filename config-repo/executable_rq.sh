#!/bin/bash

SESSION_NAME=$(basename "$PWD")
SESSION_ROOT="$PWD"
LAYOUT="$HOME/.tmux/plugins/tmuxifier/layouts/$SESSION_NAME.session.sh"

# Create layout if not exists
if [[ ! -f "$LAYOUT" ]]; then
  cat > "$LAYOUT" <<EOF
# Layout for $SESSION_NAME
session_root "$SESSION_ROOT"

if initialize_session "$SESSION_NAME"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
EOF
fi

# Load the session
tmuxifier s "$SESSION_NAME"
