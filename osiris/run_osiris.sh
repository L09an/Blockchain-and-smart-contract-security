#!/bin/bash

total_time=0
file_count=0

for file in ./Blockchain-and-smart-contract-security/sol_file/*.sol
do
	file_count=$((file_count + 1))
	filename=$(basename "$file")
	start_time=$(date +%s.%3N)
	python -u osiris/osiris.py -s "$file" 2>&1 | tee "./results/osiris_${filename%.*}.txt" > /dev/null
	end_time=$(date +%s.%3N)
	elapsed_time=$(awk "BEGIN {print ($end_time - $start_time)}")
        total_time=$(awk "BEGIN {print $total_time + $elapsed_time}")
	echo "Execution time: ${elapsed_time} s" >> "./results/osiris_${filename%.*}.txt"
done

average_time=$(awk "BEGIN {print $total_time / 13}")

echo "Average execution time: ${average_time} s"
