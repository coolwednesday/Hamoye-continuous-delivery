#!/usr/bin/env bash
# Make sure this file is executable
# chmod a+x .github/script/create-workflow-pr.sh

git config user.name github-actions
git config user.email github-actions@github.com

# Define your branch name, commit message, and other variables
PR_BRANCH="azure-configuration"
COMMIT_MESSAGE="Initial empty commit for Azure configuration"
PR_TITLE="Your pull request title"

if [ "$1" = "--pull-first" ]
then
    echo "Merging main into $PR_BRANCH"
    git checkout -b $PR_BRANCH
    git pull origin main
fi

# Create an empty commit
git commit --allow-empty -m "$COMMIT_MESSAGE"
git push origin $PR_BRANCH

echo "Create pull request for $PR_BRANCH into main"
gh pr create --base main --head $PR_BRANCH --title "$PR_TITLE" --body ""
