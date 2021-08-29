#!/usr/bin/env bash

function send_slack_message() {
    local webhook_url="${1}" msg="${2}" emoji="${3}"
    utility_check curl  
    curl_output=$(curl -Ss  -H "Content-Type: application/json" \
         -X POST \
         -d '{ "text": '\""$msg"\"', "icon_emoji": '\""$emoji"\"'}' \
         -w "\nHTTP_CODE:%{http_code}\n" \
         "${webhook_url}")
    echo "${curl_output}" | tail -n1 | grep -E  "HTTP_CODE:2[0-9][0-9]" 2> /dev/null >&1  
    retcode=$?
    if [ "${retcode}" -eq "0" ] ; then
        printf "%s\n\n" "* * *  S L A C K  M E S S A G E  S E N T  S U C C E S S F U L L Y  * * *"
    else
        printf "%s\n" "${curl_output}"
        printf "%s\n\n" "* * *  A B O R T E D * * *"
    fi
}