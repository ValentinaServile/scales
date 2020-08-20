#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Version missing"
fi

VERSION=$1

echo "Creating archive with version $VERSION..."

tar \
  --exclude="./src/*_spec.rb" \
  --exclude="*.sh" \
  --exclude=".idea" \
  --exclude=".gitignore" \
  --exclude=".ruby-version" \
  --exclude=".git" \
  --exclude="*.md" \
  --exclude="*.tar.gz" \
  -czvf \
  "scales-$VERSION.tar.gz" \
  .
