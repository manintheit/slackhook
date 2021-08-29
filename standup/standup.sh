#!/usr/bin/env bash

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
#__base="$(basename "${__file}" .sh)"
#__root="$(cd "$(dirname "${__dir}")" && pwd)"

# shellcheck disable=SC1091
source "${__dir}/utility_check.sh"
# shellcheck disable=SC1091
source "${__dir}/shuffle.sh"
# shellcheck disable=SC1091
source "${__dir}/slack.sh"

declare -a attendees=() 
user_emoji=":speaking_head_in_silhouette:"

user_list=("${user_emoji} Dennis Ritchie"
           "${user_emoji} Barack Obama"
           "${user_emoji} Red Cox"
           "${user_emoji} Alan Cox"
           "${user_emoji} Linus Torvalds"
           "${user_emoji} Jeff Bezos"
           "${user_emoji} Richard Matthew Stallman"
           "${user_emoji} Bill Gates"
           "${user_emoji} Student"
        )


#Main Program Starts Here
#----------------------------------------------------------------------------------------------

#shellcheck disable=SC2178
attendees=$(knuth_shuffle "${user_list[@]}")


printf "%s\n\n" "--------------------------------------------------------------------------------"
printf "%s\n\n"  "*  *  *    S  H  U  F  F  L  E  D     U  S  E  R       L  I  S  T       *  *  *"

for ((i = 0; i < ${#attendees[@]}; i++))
do
    echo "${attendees[$i]}"
done
printf "%s\n\n" "--------------------------------------------------------------------------------"


#send_slack_message {Slack webhook url}  {Message} {emoji}
hook="https://example.com/"
send_slack_message  "${hook}" "[$(date '+%Y-%m-%d %H:%m %p %Z')] Standup Speakers\n\n ${attendees[*]}" ":loudspeaker:"