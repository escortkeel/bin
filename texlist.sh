year="$(date +"%y")"
let "year -= 3"

folder="$HOME/Documents/year${year}"

ls "$folder"
