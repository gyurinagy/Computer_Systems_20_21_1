#!/bin/bash

# Reading names from names.txt
# then generating 5 different number between 1 and 5
# at last it writes the names and numbers separated with ; in the given files as parameter (othwerwise in in.txt)
# This will be the input files for the assignment script

function generateStudents(){
    echo -n > $1
    while read -r name || [[ -n $name ]]
    do
        echo -n "$name"
        for num in {1..5}
        do
            echo -n ";$((1 + RANDOM % 5))" 
        done 
        echo 
    done < names.txt >> $1
}

if [ $# -eq 1 ]
then
    generateStudents $1
else
    generateStudents "in.txt"
fi