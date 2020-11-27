#!/bin/bash

# This script writes out that how many from each grade the student got

grades=( 0 0 0 0 0)

function fun(){  
    while  read -r line || [[ -n $line ]]
    do
        for i in $(echo $line | tr ';' " ")
        do
            if echo $i | egrep -q '^[0-9]'
            then
                i=$i-1
            (( grades[${i}]+=1 ))
            fi
        done
    done < $1
}

if [ $# -eq 1 ]
then
    fun $1
else
    fun "in.txt"
fi

for i in `seq 0 $(( ${#grades[@]}-1)) `
do
    (( j=$i+1))
    echo "Grade($j) quantity: ${grades[${i}]}"
done