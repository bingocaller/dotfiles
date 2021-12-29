# # Use ripgrep for FZF
if test -f rg
	and test -x rg
	set -gx FZF_DEFAULT_COMMAND='rg --files --hidden'
end

# Set nvim as default visual editor unless we're inside an
# nvim instance, in which case use neovim-remote (nvr).
# See https://thoughtbot.com/upcase/videos/neovim-remote-as-preferred-editor
if [ "$NVIM_LISTEN_ADDRESS" ]
	set -gx VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
	set -gx VISUAL nvim
end

# Init zoxide - https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Volta
# set -gx VOLTA_HOME "$HOME/.volta"
# set -gx PATH "$VOLTA_HOME/bin" $PATH

# Init Starship - https://starship.rs
# starship init fish | source
#
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
