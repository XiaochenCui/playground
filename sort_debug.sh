printf "\n\tBytes' sum before sent to channel:\n\n"
grep -o -E "block: \d+" fileops/debug.log | awk '{print $2}'
printf "\n\tBytes' sum after receive from channel:\n\n"
grep -o -E "encode: \d+" fileops/debug.log | awk '{print $2}'
printf "\n\tArrays' sum before sort:\n\n"
grep -o -E "before sort: \d+" fileops/debug.log | awk '{print $3}'
printf "\n\tArrays' sum after sort:\n\n"
grep -o -E "after sort: \d+" fileops/debug.log | awk '{print $3}'
