#!/bin/bash

while true; do
    # Diff working tree to index
    diff_wtree_index=$(git diff --color-words --no-prefix)

    # Diff index to HEAD commit
    diff_head_index=$(git diff --color-words --cached --no-prefix)

    # Diff working tree to HEAD commit
    diff_head_wtree=$(git diff --color-words HEAD --no-prefix)

    # Output git log simplified
    #git_log=$(git sl)
        
    git_log=$(git log --color=always --oneline --all --graph --decorate --tags --remotes)
    # Clear the screen and print all at once
    clear
    echo -e "\e[1m\e[31mIndex\e[0m \e[1m\e[32mWTree\e[0m:\e[0m"
    echo "$diff_wtree_index"
    echo -e "\n\e[1m\e[31mHEAD\e[0m \e[1m\e[32mIndex\e[0m:\e[0m"
    echo "$diff_head_index"
    echo -e "\n\e[1m\e[31mHEAD\e[0m \e[1m\e[32mWTree\e[0m:\e[0m"
    echo "$diff_head_wtree"
    echo -e "\n\n\e[1m\e[31mGit log\e[0m:"
    echo "$git_log"


    # Wait for 1 second
    sleep 1
done