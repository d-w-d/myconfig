#!/usr/bin/env false
#
# Quick reminers of git commands

read -r -d '' GIT_USAGE <<-EOM

${GOLD_BLUE}/* BASICS */${RESET}
${GOLD}git init ${RES}
${GOLD}git clone [url] ${RES}
${GOLD}git add [file] ${RES}
${GOLD}git commit -m \"[commit message]\" ${RES}
${GOLD}git status ${RES}
${GOLD}git push [remote] [branch] ${RES}
${GOLD}git pull [remote] [branch] ${RES}
${GOLD}git checkout [branch-name] ${RES}
${GOLD}git merge [branch] ${RES}
${GOLD}git rebase [branch] ${RES}
${GOLD}git log ${RES}
${GOLD}git diff ${RES}
${GOLD}git reset [file] ${RES}
${GOLD}git rm [file] ${RES}
${GOLD}git stash ${RES}
${GOLD}git tag [tag-name] ${RES}
${GOLD}git fetch [remote] ${RES}
${GOLD}git remote add [shortname] [url]                   ${RES}<-- Adds a new remote Git repository as a shortname you can reference easily.
${GOLD}git config --global user.name \"[name]\"             ${RES}<-- Sets the name and email address that will be attached to your commits and tags.
${GOLD}git config --global user.email \"[email address]\"   ${RES}<-- Sets the name and email address that will be attached to your commits and tags.

${GOLD_BLUE}/* GIT LOG */${WHITE_BLACK}
${GOLD}git log                     ${RES}<-- Shows the commit logs
${GOLD}git log --oneline           ${RES}<-- Shows the commit history, with one commit per line
${GOLD}git log -n 5                ${RES}<-- Shows the last 5 commits
${GOLD}git log -- <file>           ${RES}<-- Shows the commit history of a specific file
${GOLD}git log --patch -- [file]   ${RES}<-- Shows the changes to the file through the commit history
${GOLD}git log --stat --oneline    ${RES}<-- Shows the commit history with the number of changed files and the number of lines that have been added or removed
${GOLD}git log --since=\"YYYY-MM-DD\"
${GOLD}git log --until=\"YYYY-MM-DD\"
${GOLD}git log --after=\"YYYY-MM-DD\"
${GOLD}git log --before=\"YYYY-MM-DD\"
${GOLD}git log --grep=\"keyword\"    ${RES}<-- Searches for commits with a message that matches the specified pattern

${GOLD_BLUE}/* GIT REVERT */${WHITE_BLACK}
${GOLD}git revert --no-commit C..HEAD ${RES}<-- Reverts the changes from the commit C to the current HEAD.
${GOLD}git commit -m \"Revert to C\" ${RES}<-- Commits the revert.

${GOLD_BLUE}/* GIT REBASE */${WHITE_BLACK}
${GOLD}git rebase [base-branch]  ${RES}<-- Rebase the current branch onto base-branch. This moves all commits in the current branch to the tip of base-branch while remaining on the current branch.
${GOLD}it rebase --continue      ${RES}<-- After resolving conflicts, continue the rebase process
${GOLD}it rebase --abort         ${RES}<-- Abort the rebase and return the branch to its original state

${GOLD_BLUE}/* GIT PUSH */${WHITE_BLACK}
${GOLD}git push [remote-name] [branch-name]    ${RES}<-- Pushes the specified branch to the specified remote. If the branch does not exist on the remote, it will be created. If the branch does exist, it will be updated with the new commits.
${GOLD}git push -u [remote-name] [branch-name] ${RES}<-- Pushes the specified branch to the remote repository and sets it as the upstream branch for future reference. The -u or --set-upstream option links the local branch with the remote one, allowing you to use git push and git pull without specifying the branch name.

${GOLD_BLUE}/* GIT BRANCH */${WHITE_BLACK}
${GOLD}git branch                                        ${RES}<-- Lists local branches
${GOLD}git branch -a                                     ${RES}<-- Lists all branches including remote branches
${GOLD}git branch --merged                               ${RES}<-- Lists the branches that have been merged into the current branch
${GOLD}git branch --unmerged                             ${RES}<-- Lists the branches that have not been merged
${GOLD}git branch -m [old-branch-name] [new-branch-name] ${RES}<-- Renames the local branch
${GOLD}git branch -d [branch-name]                       ${RES}<-- Deletes the local branch \"safely\"

${GOLD_BLUE}/* GIT CHECKOUT/SWITCH */${WHITE_BLACK}
${GOLD}git checkout -- [file]          ${RES}<-- Discards changes in the working directory for the specified file
${GOLD}it checkout [commit] -- [file]  ${RES}<-- Checkouts file from a commit
${GOLD}it switch [branch-name]         ${RES}<-- Switches to the specified branch (alternative to git checkout)

${GOLD_BLUE}/* GIT STASH */${WHITE_BLACK}
${GOLD}git stash push -m \"message\"     ${RES}<-- Saves the current working directory and index (staging area) state with a generated name and message
${GOLD}git stash list                  ${RES}<-- Displays the list of stashed changes. Each stash is given an index starting from 0 (the most recent stash)
${GOLD}git stash show [stash@{n}]      ${RES}<-- Shows the changes recorded in the stash as a diff between the stashed state and its original parent
${GOLD}git stash apply [stash@{n}]     ${RES}<-- Applies the changes recorded in the stash to the working directory
${GOLD}git stash pop [stash@{n}]       ${RES}<-- Applies the changes recorded in the stash to the working directory and removes the stash from the list
${GOLD}git stash branch [branch-name]  ${RES}<-- Creates a new branch starting from the commit at which the most recent stash was created, applies the stashed changes to the new branch, and drops the stash if the apply is successful
${GOLD}git stash drop [stash@{n}]      ${RES}<-- Removes a single stash from the list of stashed changes
${GOLD}git stash clear                 ${RES}<-- Removes all the stashed changes from the list

${GOLD_BLUE}/* GIT PATCHES */${WHITE_BLACK}
${GOLD}git diff > changes.patch ${RES}<-- creates a patch file for uncommitted changes
${GOLD}git format-patch -1 HEAD ${RES}<-- generates a patch file for the latest commit
${GOLD}git apply changes.patch  ${RES}<-- applies changes from a patch file to the working directory

${GOLD_BLUE}/* NOTE ON PATCHES */${WHITE_BLACK}
${RED_CYAN}In Git, a \"patch\" refers to a representation of changes between two sets of files,
${RED_CYAN}or more specifically, between two versions of a project.
${RED_CYAN}Patches are used to describe the differences in a format that can be applied to another set of files.
${RED_CYAN}This concept is central to many version control systems, including Git,
${RED_CYAN}where patches are a fundamental part of how changes are shared, reviewed, and applied.
${RED_CYAN}A patch in Git typically includes the following information:
${GREEN_MAGENTA}File Names: ${RED_CYAN} The names of the files that have been changed.
${GREEN_MAGENTA}Differences:${RED_CYAN} Detailed line-by-line differences (diffs) showing what has been added, removed, or altered in each file.
${GREEN_MAGENTA}Metadata:   ${RED_CYAN} Additional information such as commit messages, authorship, and timestamps when the patch is generated from a commit. ${RES}

EOM

alias alusagegit="echo \"$GIT_USAGE\" | less -S"
