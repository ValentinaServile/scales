#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Version missing"
fi

VERSION=$1

echo "Creating archive with version $VERSION..."

tar \
  --exclude="./src/*_spec.rb" \
  --exclude="./archives" \
  --exclude="*.sh" \
  --exclude=".idea" \
  --exclude=".gitignore" \
  --exclude=".ruby-version" \
  --exclude=".git" \
  -czvf \
  "archives/scales-$VERSION.tar.gz" \
  .