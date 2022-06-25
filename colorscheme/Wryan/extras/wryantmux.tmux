#!/usr/bin/env bash

# Wryan theme for tmux

set -g mode-style "fg=#9e9ecb,bg=#333333"

set -g message-style "fg=#9e9ecb,bg=#333333"
set -g message-command-style "fg=#9e9ecb,bg=#333333"

set -g pane-border-style "fg=#333333"
set -g pane-active-border-style "fg=#9e9ecb"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#9e9ecb,bg=#53a6a6"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#477ab3,bg=#9e9ecb,bold] #S "
set -g status-right "#[fg=#9e9ecb,bg=#53a6a6] #{prefix_highlight} #[fg=#9e9ecb,bg=#333333] %Y-%m-%d | %I:%M %p #[fg=#477ab3,bg=#9e9ecb,bold] #h "

setw -g window-status-activity-style "underscore,fg=#333333,bg=#53a6a6"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#333333,bg=#53a6a6"
setw -g window-status-format "#[default] #I | #W #F "
setw -g window-status-current-format "#[fg=#9e9ecb,bg=#333333,bold] #I | #W #F "
