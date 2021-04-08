#!/bin/bash

GIT_TAG_LATEST=$(curl -s -u ${GIT_USER}:${GIT_PASS} -H "Accept: application/vnd.github.v3+json" -X GET https://api.github.com/repos/${GITHUB_REPOSITORY}/git/refs/tags | jq -r .[].ref | cut -d "/" -f3 | sort -rn | head -1)

MAJOR_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f1)
MINOR_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f2)
PATCH_VERSION=$(echo ${GIT_TAG_LATEST} | cut -d "v" -f2 | cut -d "." -f3)

PATCH_VERSION=$((PATCH_VERSION+1))

git config --global user.email "${GIT_USER}"
git config --global user.name "buildbot"

mkdir -p ~/.ssh/
aws s3 sync s3://bancoripley-ci/ssh/buildbot/ ~/.ssh/
chmod 400 ~/.ssh/id_rsa
ssh-keygen -F github.com || ssh-keyscan github.com >> ~/.ssh/known_hosts

rm -rf /tmp/git/ && mkdir -p /tmp/git/ && cd /tmp/git/
git clone git@github.com:${GITHUB_REPOSITORY}.git

cd /tmp/git/$(echo ${GITHUB_REPOSITORY} | cut -d "/" -f2)/ && git checkout master
git tag -a v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION} -m "release v${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
git push origin --tags
