function fish_setup --description 'Add Homebew dirs to $PATH, set vi mode, and install plugins'
	if test (uname -m) = 'arm64'
		fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
	else
		fish_add_path /usr/local/bin /usr/local/sbin
	end
	fish_vi_key_bindings
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end
