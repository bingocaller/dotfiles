function note --argument-names name dir --description "Create markdown note with name and date, plus optional path"
    set -l current_date (date +"%Y-%m-%d")
    set -l filename (string join _ $name $current_date)
    if string length --quiet $dir
        nvim $dir/$filename.md
    else
        nvim ~/Documents/notes/$filename.md
    end
end
