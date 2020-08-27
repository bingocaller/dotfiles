# Defined in - @ line 1
function pr --wraps='hub pull-request' --description 'alias pr=hub pull-request'
  hub pull-request $argv;
end
