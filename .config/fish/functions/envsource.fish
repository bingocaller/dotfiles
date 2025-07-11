# Usage: envsource [<path/to/env>]
function envsource -d "Export all environment variables from a given file."
    set --local file_name .env
    if test -n $argv[1] # Did we receive a file path argument?
        if test -e $argv[1] # Does the provided file exist?
            set --local file_name $argv[1]
        else
            echo "File $argv[1] doesn’t exist. Looking for default (.env) instead."
        end
    end
    if test -e $file_name # Does the env file exist?
        for line in (cat $file_name | grep -v '^#' | grep -v '^\s*$')
            set item (string split -m 1 '=' $line)
            set --global --export $item[1] $item[2]
            echo "Exported key $item[1]"
        end
    else
        echo "File $file_name doesn’t exist."
    end
end
