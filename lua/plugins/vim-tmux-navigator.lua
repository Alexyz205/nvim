-- ============================================================================
-- Vim-Tmux-Navigator Plugin Configuration
-- ============================================================================
-- Seamless navigation between Neovim splits and Tmux panes
-- Allows using same keybindings (C-h/j/k/l) for both contexts
-- ============================================================================
--
-- Requirements:
--   - Tmux must be configured with matching keybindings
--   - Add to ~/.tmux.conf:
--     is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
--     bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
--     bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
--     bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
--     bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'
--
-- See: https://github.com/christoomey/vim-tmux-navigator
-- ============================================================================

return {
  "christoomey/vim-tmux-navigator",
  lazy = false, -- Load immediately to ensure navigation works from start
}
