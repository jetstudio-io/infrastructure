docker buildx build \
  --push --platform linux/amd64,linux/arm64/v8 \
  --build-arg PHP_IMAGE=8.2-fpm-alpine --build-arg DB_EXT=pdo_mysql \
  -t jetstudio/php:fpm-v8-pdo . -f Dockerfile_php