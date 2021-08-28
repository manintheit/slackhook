#!/bin/bash

function check_utility(){
    local cmd="$1"
    if ! command -v "${cmd}" > /dev/null 2>&1; then
        >&2 echo "'${cmd}' does not exist or not in your PATH..."
        >&2 echo "exitting..."
        
        >&2 printf "%s\n" "------------------------------------------------------------"
        >&2 printf "\n%s \u274c\n" "Required utility: '${cmd}' NOT found. No More checks"
        >&2 printf "%s\n\n\n" "------------------------------------------------------------"
        exit 254
    else
        printf "%s\n" "----------------------------------------------------------------"
        printf "\n%s \u2714\n" "Required utility: '${cmd}' found. "
        printf "%s\n\n\n" "----------------------------------------------------------------"
    fi 
}