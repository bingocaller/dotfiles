# Source: https://github.com/junegunn/fzf/wiki/Examples-(fish)#git
function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | rg -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end
