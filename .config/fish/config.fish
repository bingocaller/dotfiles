# Init zoxide - https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Volta
# set -gx VOLTA_HOME "$HOME/.volta"
# set -gx PATH "$VOLTA_HOME/bin" $PATH

# Set FZF UI, color scheme, and custom key bindings
# Colour scheme made using https://minsw.github.io/fzf-color-picker/
# Not acutally used, set at --universal variable from command line,
# just kept here for documentation, I guess?
# set -g FZF_DEFAULT_OPTS "--prompt='❯ ' --pointer='›' --marker='• ' --color=fg:#c0caf5,bg:#1a1b26,hl:#33467c --color=fg+:#e2ecff,bg+:#4d4e59,hl+:#a0a8d3 --color=info:#e2ecff,prompt:#f7768e,pointer:#bb9af7 --color=marker:#ff9e64,spinner:#9d7cd8,header:#9ece6a"

# Abbreviations stored in `config.fish` from v3.6.0 as per recommended in
# documentation
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
abbr --add ll "eza -l --color always --icons -ah -s type"
abbr --add ls "eza -G --color auto --icons -a -s type"
abbr -a -- ping 'prettyping --nolegend'
# abbr -a -- pr 'hub pull-request' # Already provided by (and better) `gh pr`
abbr -a -- rm trash
abbr -a -- tree 'tree -C'
abbr -a -- yfd 'yarn frontend dev'
abbr -a -- yfdl 'yarn frontend dev-local'
abbr -a -- zkei 'zk edit --interactive'
