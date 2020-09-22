#!/bin/bash

git fetch --prune --unshallow --tags origin master
git checkout master

python /scripts/changelog-ci.py

git config user.name ${INPUT_COMMITTER_USERNAME}
git config user.email ${INPUT_COMMITTER_EMAIL}

git add ${INPUT_CHANGELOG_FILENAME}
git commit -m "Add change log [ci skip]"
git push -u origin master
