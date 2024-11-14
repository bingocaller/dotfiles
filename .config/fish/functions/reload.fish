# Defined in - @ line 1
function reload --wraps='exec fish -l' --description 'alias reload=exec fish -l'
	exec fish -l
end
