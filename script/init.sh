#!/bin/bash
cp .env.dist .env
sed -i "s/COMPOSER_GITLAB_TOKEN=/COMPOSER_GITLAB_TOKEN=${COMPOSER_GITLAB_TOKEN}\n/g" .env