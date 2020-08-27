# Defined in - @ line 1
function reload --wraps='exec /usr/local/bin/fish -l' --description 'alias reload=exec /usr/local/bin/fish -l'
  exec /usr/local/bin/fish -l $argv;
end
