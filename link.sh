#!/usr/bin/env bash

# Define the source and target paths
SOURCE="/mnt/data/Documents"
TARGET="$HOME/Documents"

# Check if the symlink already exists
if [ ! -L "$TARGET" ]; then
  echo "Symlink does not exist. Creating it..."
  ln -s "$SOURCE" "$TARGET"
else
  echo "Symlink already exists. No action taken."
fi

