function killport --wraps lsof --description 'Kills all processes running on the port number specified'
	echo 'Killing all processes at port' $argv[1]
	lsof -ti :$argv[1] | xargs kill
end
