#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR"

# docker buildx build --builder=multiarch-limit \
# 	-f Dockerfile.alpine \
# 	--platform linux/386 \
# 	--platform linux/amd64 \
# 	--platform linux/arm/v6 \
# 	--platform linux/arm/v7 \
# 	--platform linux/arm64/v8 \
# 	--platform linux/s390x \
# 	--build-arg ENABLED_MODULES="ndk lua" \
# 	-t omaj/nginx-with-lua:latest --pull --push .

docker buildx build --builder=multiarch-limit \
	--platform linux/amd64 \
	--platform linux/arm64/v8 \
	--build-arg ENABLED_MODULES="ndk lua" \
	-t omaj/nginx-with-lua:latest --pull --push .

echo -e "\e[32m Done \e[0m"