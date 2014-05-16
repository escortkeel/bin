if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit -1
fi

year="$(date +"%y")"
let "year -= 3"

folder="$HOME/Documents/year${year}/$1"
infile="$folder/$1.tex"
outfile="$folder/$1.pdf"

if [[ ! -e "$infile" ]]; then
    if [ ! "$2" = "-c" ]; then
        echo "You must supply -c in order to create a new project"
        exit -1
    else
        cp -r "$HOME/Documents/template" "$folder"
        mv "$folder/template.tex" "$infile"
    fi
fi

if [ "$2" = "-r" ]; then 
    set -e

    cd "$folder"
    
    aspell -d en_GB -c -t "$infile"
    pdflatex "$infile"
    xdg-open "$outfile" > /dev/null 2>&1 &
else
    vim "$infile"
fi
