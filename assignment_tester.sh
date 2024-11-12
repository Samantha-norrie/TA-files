#!/bin/bash

for i in {1..20}; do
    echo "Running iteration $i..."

    command_stub="./STUDENT_FILE"

    summary_command="$command_stub route_summary ../tests/$i.txt"
    summary_output="../tests/${i}_summary.txt"

    days_command="$command_stub days ../tests/$i.txt"
    days_output="../tests/${i}_days.txt"


    actual_summary_output=$($summary_command)
    actual_days_output=$($days_command)


    if diff <(echo "$actual_summary_output") "$summary_output"; then
        echo "SUMMARY Iteration $i: Output matches expected output."
    else
        echo "SUMMARY Iteration $i: Output differs from expected output."
    fi

    if diff <(echo "$actual_days_output") "$days_output"; then
        echo "DAYS Iteration $i: Output matches expected output."
    else
        echo "DAYS Iteration $i: Output differs from expected output."
    fi
done
