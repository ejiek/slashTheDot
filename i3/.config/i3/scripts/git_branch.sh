#!/bin/bash

git_status="$(git status 2> /dev/null)"
on_branch="On branch ([^${IFS}]*)"

if [[ $git_status =~ $on_branch ]]; then
    branch=${BASH_REMATCH[1]}
    output=" $branch"
    if [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo "$output ✚ "
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo "$output ✔ "
    else
        echo "$output ● "
    fi
fi


