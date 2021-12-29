# Defined in - @ line 1
function preview --wraps=fzf --description 'alias preview=fzf --preview "bat --color=always {}"'
  fzf --preview "bat --color=always {}" $argv;
end
