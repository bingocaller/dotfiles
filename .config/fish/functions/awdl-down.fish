function awdl-down --wraps='ifconfig awdl0 down' --description 'alias awdl-down=ifconfig awdl0 down'
  ifconfig awdl0 down $argv; 
end
