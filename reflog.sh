#!/bin/bash

while true; do
    # Diff working tree to index
    diff_wtree_index=$(git diff --color-words --no-prefix | sed '2d; 3d; 4d; 5d')

    # Diff index to HEAD commit
    diff_head_index=$(git diff --color-words --cached --no-prefix | sed '2d; 3d; 4d; 5d')

    # Diff working tree to HEAD commit
    diff_head_wtree=$(git diff --color-words HEAD --no-prefix | sed '2d; 3d; 4d; 5d')

    # Output git log simplified
    #git_log=$(git sl)
    #git_log=$(git branchless smartlog)
        
    git_log=$(git log --color=always --reflog --oneline --all --graph --decorate --tags --remotes --topo-order --format="%C(auto)%h%C(reset) %C(yellow)%d%C(reset) %C(green)%s%C(reset) %C(cyan)(%cr)%C(reset) %C(blue)%b%C(reset) %C(magenta)%+%C(yellow) %-%C(reset)")
    # Clear the screen and print all at once
    clear
    #echo -e "\e[1m\e[31mIndex\e[0m \e[1m\e[32mWTree\e[0m:\e[0m"
    #echo "$diff_wtree_index"
    #echo -e "\n\e[1m\e[31mHEAD\e[0m \e[1m\e[32mIndex\e[0m:\e[0m"
    #echo "$diff_head_index"
    #echo -e "\n\e[1m\e[31mHEAD\e[0m \e[1m\e[32mWTree\e[0m:\e[0m"
    #echo "$diff_head_wtree"
    #echo -e "\n\n\e[1m\e[31mGit log\e[0m:"
    #echo "$git_log"
    echo -e "\n\n\e[1m\e[31mReflog\e[0m:"
    git --no-pager reflog --color=always
    #Wait for 1 second
    sleep 1
done
