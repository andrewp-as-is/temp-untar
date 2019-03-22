#!/usr/bin/env bash
{ set +x; } 2>/dev/null

path="$(mktemp -d)" || exit
src="$path/archive.tar.gz"
( set -x; tar -czf "$src" -C "${BASH_SOURCE[0]%/*}" . ) || exit
path="$(set -x; temp-untar "$src")" || exit
( set -x; find "$path" -type f )
