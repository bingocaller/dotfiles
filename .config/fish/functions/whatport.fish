function whatport --wraps lsof
	lsof -i :$argv;
end
