#!/bin/bash

# Prompt user for config.
echo Welcome to TEAM GENERATOR. Fill in the data, and you will get your teams, based on randomness
read -p 'Configuration: Number of teams: ' num_of_teams

# Populate "arr" array with strings from text file. 
# Each line becomes an element in the array.
arr=()
IFS=$'\n' # make newlines the only separator
while read line; do
  arr+=("$line")
done < team_members.txt

# Shuffle array randomly.
my_random_arr=( $(shuf -e "${arr[@]}") )

# Fill up teams_arr by looping through "my_random_arr" and use modulus operator
# to assign a team for each element.
count=0
for arrValue in "${my_random_arr[@]}"
do
   team=$(($count % $num_of_teams))
   previousValue=${teams_arr[$team]}
   teams_arr[$team]="$arrValue, $previousValue"
   count=$(expr $count + 1)
done

# Display result for user
echo Num of teams configured: $num_of_teams
count=1
echo "=========TEAMS GENERATED========="
for arrValue in "${teams_arr[@]}"; do
  echo "TEAM-$count: $arrValue"
  count=$(expr $count + 1)
done
echo "=========TEAMS GENERATED========="
