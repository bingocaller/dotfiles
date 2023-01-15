# Init zoxide - https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Volta
# set -gx VOLTA_HOME "$HOME/.volta"
# set -gx PATH "$VOLTA_HOME/bin" $PATH

# Custom colour scheme: TokyoNight
# https://github.com/folke/tokyonight.nvim/tree/main/extras/fish_tokyonight_night.fish

# TokyoNight Color Palette
set -l tokyo_night_foreground c0caf5
set -l tokyo_night_selection 33467C
set -l tokyo_night_comment 565f89
set -l tokyo_night_red f7768e
set -l tokyo_night_orange ff9e64
set -l tokyo_night_yellow e0af68
set -l tokyo_night_green 9ece6a
set -l tokyo_night_purple 9d7cd8
set -l tokyo_night_cyan 7dcfff
set -l tokyo_night_pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $tokyo_night_foreground
set -g fish_color_command $tokyo_night_cyan
set -g fish_color_keyword $tokyo_night_pink
set -g fish_color_quote $tokyo_night_yellow
set -g fish_color_redirection $tokyo_night_foreground
set -g fish_color_end $tokyo_night_orange
set -g fish_color_error $tokyo_night_red
set -g fish_color_param $tokyo_night_purple
set -g fish_color_comment $tokyo_night_comment
set -g fish_color_selection --background=$tokyo_night_selection
set -g fish_color_search_match --background=$tokyo_night_selection
set -g fish_color_operator $tokyo_night_green
set -g fish_color_escape $tokyo_night_pink
set -g fish_color_autosuggestion $tokyo_night_comment

# Completion Pager Colors
set -g fish_pager_color_progress $tokyo_night_comment
set -g fish_pager_color_prefix $tokyo_night_cyan
set -g fish_pager_color_completion $tokyo_night_foreground
set -g fish_pager_color_description $tokyo_night_comment

# Set FZF UI, color scheme, and custom key bindings
# Colour scheme made using https://minsw.github.io/fzf-color-picker/
# Not acutally used, set at --universal variable from command line,
# just kept here for documentation, I guess?
# set -g FZF_DEFAULT_OPTS "--prompt='❯ ' --pointer='›' --marker='• ' --color=fg:#c0caf5,bg:#1a1b26,hl:#33467c --color=fg+:#e2ecff,bg+:#4d4e59,hl+:#a0a8d3 --color=info:#e2ecff,prompt:#f7768e,pointer:#bb9af7 --color=marker:#ff9e64,spinner:#9d7cd8,header:#9ece6a"
