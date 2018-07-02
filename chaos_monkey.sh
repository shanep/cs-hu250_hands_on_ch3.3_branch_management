#!/bin/bash

function append_and_commit()
{
    local branch_name=$( echo $1 | cut -d'-' -f2 )
    local file_name_to_be_appended_and_committed="index_${branch_name}.html"
    local file_content=$1
    local commit_message=$1

    git checkout $branch_name 

    echo $file_content >> $file_name_to_be_appended_and_committed

    git add $file_name_to_be_appended_and_committed

    git commit -m "$commit_message"

    sleep 2
}

bm="master"
append_and_commit "C1-${bm}"

b1="lambda"
git branch $b1

append_and_commit "C2-${bm}"

b2="kappa"
git branch $b2

append_and_commit "C3-${b1}"

b1a="omega_merged_to_delete"
git branch $b1a

append_and_commit "C4-${b2}"

git checkout $bm
git merge $b1 -m "C5-Merge branch $b1 into $bm"
sleep 2

append_and_commit "C6-${b2}"

b3="beta"
git branch $b3

b3a="epsilon"
git branch $b3a

append_and_commit "C7-${b3}"

append_and_commit "C8-${bm}"

b4="pi"
git branch $b4

b4a="delta"
git branch $b4a

append_and_commit "C9-${b2}"

git checkout $b2
git merge $b3 -m "C10-Merge branch $b3 into $b2"
sleep 2

append_and_commit "C11-${b4a}"

git checkout $bm
git merge $b4a
sleep 2

append_and_commit "C12-${b4}"

append_and_commit "C13-${b2}"

b5="gamma"
git branch $b5

git checkout $bm
git merge $b2 -m "C14-Merge branch $b2 into $bm"
sleep 2

append_and_commit "C15-${b5}"

append_and_commit "C16-${b4}"

b6="sigma"
git branch $b6

append_and_commit "C17-${b4}"

append_and_commit "C18-${b6}"

b7="alpha_not_merged_to_delete"
git branch $b7

append_and_commit "C19-${bm}"

echo "$0 completed!"
