#!/usr/bin/env bash

      declare -a ReleaseColumn=("CI" "DOC" "FIX" "FEATURE" "FILTERADD" "FILTERMOD" "REVERT" "TEST")
      for col in ${ReleaseColumn[@]};
      do
        __columnNotes=()
        while IFS= read -r line; do
            __columnNotes+=( "$line" )
        done < <( (git log --pretty=format:"%s" -i -E --grep="^(\[$col\])"$finalversion...... |cat) )
        __commitlist="[$col]"$'\n'
        for i in "${__columnNotes[@]}"
        do
          IFS=' '
          read -ra my_array2 <<< $i
          __commitlist+="${my_array2[1]}"$'\n'
        done
        echo $__commitlist
      done
# Declare an array of string with type
#declare -a ReleaseColumn=("CI" "DOC" "FIX" "FEATURE" "FILTERADD" "FILTERMOD" "REVERT" "TEST")
#for col in ${ReleaseColumn[@]}; do
#     __commitlist=()
#  while IFS= read -r line; do
#      __commitlist+=( "$line" )
#  done < <( (git log --pretty=format:"%s" -i -E --grep="^(\[$col\])"$finalversion...... |cat) )
#  all_ci="[$col]"$'\n'
#  for i in "${__commitlist[@]}"
#  do
#    IFS=' '
#    read -ra my_array2 <<< $i
#    all_ci+="${my_array2[1]}"$'\n'
#  done
#
#  echo $all_ci
#done
#__commitlist=()
#while IFS= read -r line; do
#    __commitlist+=( "$line" )
#done < <( (git log --pretty=format:"%s" -i -E --grep="^(\[CI\])"... |cat) )
#
#all_ci="[CI]"$'\n'
#for i in "${__commitlist[@]}"
#do
#  IFS=' '
#  read -ra my_array2 <<< $i
#  all_ci+="${my_array2[1]}"$'\n'
#done
#
#echo $all_ci