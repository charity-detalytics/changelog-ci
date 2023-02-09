#!/bin/bash
git config --global --add safe.directory '*'

git fetch --prune --unshallow --tags origin main
git checkout main
git pull --rebase

python /scripts/changelog-ci.py

git config user.name ${INPUT_COMMITTER_USERNAME}
git config user.email ${INPUT_COMMITTER_EMAIL}

git add ${INPUT_CHANGELOG_FILENAME}
git commit -m "Add change log [ci skip]"
git push -u origin main
