#!/bin/bash

FILE=$1

SKIP_TO=0

while true; do
  output=$(osbx show $FILE --skip-to $SKIP_TO --silent 2)

  SKIP_TO=$(echo $output | grep -Po "(?<=Found at byte : )\d+")

  if [[ $SKIP_TO == "" ]]; then
    break
  fi

  SKIP_TO=$[$SKIP_TO + 128]

  echo "$output"
  echo ""
done
