# Defined in - @ line 1
function ping --wraps='prettyping --nolegend' --description 'alias ping=prettyping --nolegend'
  prettyping --nolegend $argv;
end
