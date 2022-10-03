#!/usr/bin/env bash

function showHelp
{
  echo -e "Time To Bed is a little script which slowly reduces computer volume until getting to sleep.\n"
  echo "Usage: ./time_to_bed.sh [mins]"
  echo -e "\t mins: Number of minutes to wait before putting computer to sleep."
}

if [ "$#" -lt "1" ]; then
  showHelp && exit 1
fi

remaining_mins=$1
reduce_amount=$((100 / remaining_mins))

echo "Will decrease volume by $reduce_amount% every minute."

for minute in remaining_mins
do
  sleep 60
  echo "Reducing volume, still $((remaining_mins - minutes - 1)) mins before sleep."
  amixer set Master $reduce_amount%- -q
done

echo "Going to sleep, good night!"
systemctl suspend
