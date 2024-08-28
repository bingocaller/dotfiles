fish_add_path /usr/local/sbin /Users/bingocaller/.cargo/bin /Users/bingocaller/go/bin

# NOTE: All variables in this file are set using `--global` because it’s faster
# than `--universal` and the variables will get set on every initialisation.

# ╭───────╮
# │ Shell │
# ╰───────╯
set --global fish_greeting # Don’t print welcome message for every new shell
set --global SHELL (which fish) # Not sure this is necessary bit it can’t hurt
set --global HISTTIMEFORMAT "%Y-%m-%d %T " # This one may or may not be useful
set --global EDITOR nvim # Use Neovim as the editor for both line-based and
set --global VISUAL nvim # visual purposes
# Cursor configuration
# Make it as Vim-like as possible, plus a bit of blinking in insert mode
set --global fish_cursor_default block
set --global fish_cursor_insert line blink
set --global fish_cursor_replace_one underscore
set --global fish_cursor_visual block

# ╭───────────────╮
# │ Tide (prompt) │
# ╰───────────────╯
set --global tide_git_icon 

# ╭─────╮
# │ FZF │
# ╰─────╯
fzf --fish | source
set --global fzf_fd_opts "--hidden --type f"
set --global FZF_DEFAULT_OPTS "\
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --prompt='❯ ' --pointer='›' --marker='• '"

# ╭───────────────────╮
# │ zk (Zettelkasten) │
# ╰───────────────────╯
set --global ZK_NOTEBOOK_DIR "/Users/bingocaller/Documents/notes"

# ╭────────╮
# │ zoxide │
# ╰────────╯
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# ╭───────╮
# │ Volta │
# ╰───────╯
# set --export --global VOLTA_HOME "$HOME/.volta"
# set --export --global PATH "$VOLTA_HOME/bin" $PATH

# ╭──────────╮
# │ lesspipe │
# ╰──────────╯
# https://github.com/wofr06/lesspipe
set --global LESSOPEN "|/usr/local/bin/lesspipe.sh %s"

# ╭───────────────╮
# │ Abbreviations │
# ╰───────────────╯
# Stored in `config.fish` from v3.6.0 as per recommended in documentation
# https://fishshell.com/docs/current/cmds/abbr.html
abbr -a -- awdld 'ifconfig awdl0 down'
abbr -a -- awdlu 'ifconfig awdl0 up'
abbr -a -- g git
abbr -a -- gap 'git add --patch --update'
abbr -a -- gash 'git stash'
abbr -a -- gasha 'git stash apply'
abbr -a -- gashl 'git stash list'
abbr -a -- gashp 'git stash pop'
abbr -a -- gashu 'git stash --include-untracked'
abbr -a -- gb 'git branch'
abbr -a -- gc 'git commit'
abbr -a -- gcb 'git checkout -b'
abbr -a -- gch 'git checkout'
abbr -a -- gcl 'git clone'
abbr -a -- gcm 'git commit --amend'
abbr -a -- gcmn 'git commit --amend --no-edit'
abbr -a -- gcol 'git checkout master && git pull'
abbr -a -- gcom 'git fetch && git checkout master'
abbr -a -- gcon 'git switch main && git pull'
abbr -a -- gcop 'git checkout -p'
abbr -a -- gcp 'git cherry-pick'
abbr -a -- gdmb git-delete-merged-branches
abbr -a -- gds 'git diff --staged'
abbr -a -- gdsb git-delete-squashed-branches
abbr -a -- gf 'git fetch'
abbr -a -- gfa 'git fetch --all'
abbr -a -- gl 'git log'
abbr -a -- gm 'git merge'
abbr -a -- gpl 'git pull'
abbr -a -- gplr 'git pull --rebase'
abbr -a -- gps 'git push'
abbr -a -- gpsf 'git push --force-with-lease'
abbr -a -- gpsu 'git push --set-upstream origin (git branch --show-current)'
abbr -a -- gr 'git remove --verbose'
abbr -a -- grb 'git rebase'
abbr -a -- grba 'git rebase --abort'
abbr -a -- grbc 'git rebase --continue'
abbr -a -- grbi 'git rebase --interactive'
abbr -a -- grs 'git reset --'
abbr -a -- grsh 'git reset --hard'
abbr -a -- grsl 'git reset HEAD~'
abbr -a -- gsh 'git show'
abbr -a -- gsmp 'git switch main && git pull'
abbr -a -- gsw 'git switch'
abbr -a -- gswc 'git switch --create'
abbr --add ll "eza --long --color always --icons --all --header --hyperlink --sort type"
abbr --add ls "eza --grid --color auto --icons --all --hyperlink --sort type"
abbr -a -- ping 'prettyping --nolegend'
# abbr -a -- pr 'hub pull-request' # Already provided by (and better) `gh pr`
abbr -a -- rm trash
abbr -a -- tree 'tree -C'
abbr -a -- yfd 'yarn frontend dev'
abbr -a -- yfdl 'yarn frontend dev-local'
abbr -a -- zkei 'zk edit --interactive'

# Created by `pipx` on 2024-06-06 12:33:41
set PATH $PATH /Users/bingocaller/.local/bin
