#!/usr/bin/env bash
# Make sure this file is executable
# chmod a+x .github/script/create-workflow-pr.sh

git config user.name github-actions
git config user.email github-actions@github.com




if [ "$1" = "--pull-first" ]
then
    echo "Merging main into $PR_BRANCH"
    git checkout -b $PR_BRANCH
    git pull origin main 
    # Create an empty commit
    git commit --allow-empty -m "$COMMIT_MESSAGE"
    git push origin $PR_BRANCH
fi

echo "Create pull request for $PR_BRANCH into main"
gh pr create --base main --head $PR_BRANCH --title "$PR_TITLE" --body ""
