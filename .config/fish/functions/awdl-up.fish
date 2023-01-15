function awdl-up --wraps='ifconfig awdl0 up' --description 'alias awdl-up=ifconfig awdl0 up'
  ifconfig awdl0 up $argv; 
end
