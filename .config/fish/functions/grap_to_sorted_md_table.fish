function grap_to_sorted_md_table --argument-names query --description "Convert Grap! search results for $query into a table format sorted by number of instances"
    if ! string length --quiet $query
        echo "Error: No query provided!"
    else
        echo '| Repository name | Number of references |' >grap_table.md
        echo '| --------------- | -------------------- |' >grap_table.md
        curl "http://shared-dev-1.issuu.com:8055/?q=$query&format=raw" | sed -E 's/^([^\/]+)\/.+/\1/g' | sort | uniq -c | sort -gr | sed -E 's/[[:space:]]*([[:digit:]]+) ([[:print:]]+)/| \2 | \1 |/g' >>grap_table.md
    end
end
