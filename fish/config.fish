status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)

# # Use ripgrep for FZF
# if test -f rg
# 	and test -x rg
# 	set -gx FZF_DEFAULT_COMMAND='rg --files --hidden'
# end

# Set nvim as default visual editor unless we're inside an
# nvim instance, in which case use neovim-remote (nvr).
# See https://thoughtbot.com/upcase/videos/neovim-remote-as-preferred-editor
if [ "$NVIM_LISTEN_ADDRESS" ]
	set -gx VISUAL "nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
	set -gx VISUAL nvim
end

# Init Starship - https://starship.rs
starship init fish | source

# Init zoxide - https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
