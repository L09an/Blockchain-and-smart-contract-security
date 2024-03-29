#!/bin/bash

for file in ./Blockchain-and-smart-contract-security/sol_file/*.sol
do
        file_count=$((file_count + 1))
        filename=$(basename "$file")
        start_time=$(date +%s.%3N)
	python -u oyente.py -s "$file" 2>&1 | tee "./results/oyente_${filename%.*}.txt" > /dev/null
	end_time=$(date +%s.%3N)
	elapsed_time=$(awk "BEGIN {print $end_time - $start_time}")
        total_time=$(awk "BEGIN {print $total_time + $elapsed_time}")
        echo "Execution time: ${elapsed_time} s" >> "./results/oyente_${filename%.*}.txt"

done

average_time=$(awk "BEGIN {print $total_time / 14}")
echo "Average execution time: ${average_time} s"
