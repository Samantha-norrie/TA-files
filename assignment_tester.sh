#!/bin/bash

for i in {1..20}; do
    echo "Running iteration $i..."

    command="./"
    output="../tests/$i"

    if (( i % 2 == 0 )); then
        command="$command summary"
        output="${output}_summary.txt"
    else
        command="$command days"
        output="${output}_days.txt"
    fi

    command="$command ../tests/$i.txt"

    actual_output=$($command)

    if diff <(echo "$actual_output") "$output"; then
        echo "Iteration $i: Output matches expected output."
    else
        echo "Iteration $i: Output differs from expected output."
    fi
done
