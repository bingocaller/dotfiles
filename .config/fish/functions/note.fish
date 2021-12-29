function note -a name dir -d "Create markdown note with name and date, plus optional path"
  set -l current_date (date +"%Y-%m-%d")
  set -l filename (string join _ $name $current_date)
  if ! string length --quiet $dir
    nvim ~/Documents/notes/$filename.md
  else
    nvim $dir/$filename.md
  end
end
