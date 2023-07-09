#!/bin/bash
HOST=$1
case $HOST in
'github')
  git remote set-url origin git@github-jetx:jetstudio-io/infrastructure.git
  ;;
'gitlab')
  git remote set-url origin git@gitlab-jetx:jet-studio-io/infrastructure.git
  ;;
esac