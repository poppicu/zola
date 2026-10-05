#!/bin/sh
set -eu
# Pinned to the Tera 1 version supported by poppicu/tabi_personal.
version=0.19.2
checksum=0798e69b86c628ddcb264ebd86c8cc8dce7670b9049060bf94faa73f6857cd9c
case "$(uname -s):$(uname -m)" in
    Linux:x86_64) ;;
    *) echo 'This installer supports Linux x86_64; install Zola 0.19.2 manually on other platforms.' >&2; exit 1 ;;
esac
destination=${1:?Usage: install-zola.sh DESTINATION}
mkdir -p "$destination"
archive=$(mktemp)
trap 'rm -f "$archive"' EXIT HUP INT TERM
curl --proto '=https' --tlsv1.2 -fsSL "https://github.com/getzola/zola/releases/download/v${version}/zola-v${version}-x86_64-unknown-linux-gnu.tar.gz" -o "$archive"
printf '%s  %s\n' "$checksum" "$archive" | sha256sum -c -
tar -xzf "$archive" -C "$destination" zola
"$destination/zola" --version
