#!/bin/sh -e

if [ $# -gt "1" ]
    then
        echo "Too many arguments! Just use one"
elif [ -z "$1" ]
    then
        echo "Can't use empty string"
else
    declare -a arr=("common.scss" "320-480.scss" "481-767.scss" "768-1024.scss" "1025-1280.scss" "1281.scss")
    mkdir -p -- ../styles/$1/modules && cd $_
    for i in "${arr[@]}"
    do
        touch "_$i"
    done
    cd .. && touch "index.scss"
    for i in "${arr[@]}"
    do
        echo "@import './modules/"$i"';" >> "index.scss"
    done
    echo "Files created!"
fi

