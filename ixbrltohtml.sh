#!/bin/bash

input_file=$3
output_file=$2

# assert that the number of arguments passed to to the script is 3
# and that the first argument is a option, -o for selecting the output
# path
if [ $# -ne 3 ] || [ $1 != "-o" ];
then
    echo "Usage: ./ixbrltohtml.sh -o ixbrlview.html ixbrl.txt"
    exit 1
fi

# ensure that the file exists
if [ ! -e $input_file ];
then
    echo "$input_file - doesn't exist. Ensure you typed the correct path."
    exit 1
fi

input_file_arg=$(basename $input_file)
output_file_arg=$(basename $output_file)

# check that the directory to output the html exists
# if it doesn't create it
output_file=$(dirname $output_file)
if [ ! -d $output_file ];
then
    mkdir $output_file
fi

input_file=$(cd "$(dirname "$input_file")"; pwd -P)/$input_file_arg
output_file=$(cd "$output_file"; pwd -P)/$output_file_arg

docker run --rm \
    --mount type=bind,src=$(dirname $input_file),dst=/in \
    --mount type=bind,src=$(dirname $output_file),dst=/out \
    ixbrltohtml \
    --out /out/$output_file_arg \
    /in/$input_file_arg
