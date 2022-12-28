#!/binbash

cp .env.dist .env
sed -i.bak "s/^DATABASE_PASSWD=/\DATABASE_PASSWD=${DATABASE_PASSWD}" .env
sed -i.bak "s/^COMPOSER_GITLAB_TOKEN==/\COMPOSER_GITLAB_TOKEN==${COMPOSER_GITLAB_TOKEN=}" .env