#!/bin/sh
# Installs the vonbraun connector from the public release tarball.
# VONBRAUN_TARBALL_URL overrides the download address.
set -eu

URL="${VONBRAUN_TARBALL_URL:-https://github.com/daskinnyman/vonbraun-release/releases/latest/download/vonbraun.tgz}"

fail() {
  echo "vonbraun install: $1" >&2
  exit 1
}

command -v node >/dev/null 2>&1 || fail "Node 22.4 or newer is required, but node was not found"
version=$(node -p 'process.versions.node' 2>/dev/null) || fail "Node 22.4 or newer is required"
version=${version#v}
major=${version%%.*}
rest=${version#*.}
minor=${rest%%.*}
case "$major$minor" in
  '' | *[!0-9]*) fail "Node 22.4 or newer is required, found $version" ;;
esac
if [ "$major" -lt 22 ] || { [ "$major" -eq 22 ] && [ "$minor" -lt 4 ]; }; then
  fail "Node 22.4 or newer is required, found $version"
fi
command -v npm >/dev/null 2>&1 || fail "npm was not found"
command -v curl >/dev/null 2>&1 || fail "curl was not found"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT HUP INT TERM

curl -fsSL -o "$tmp/vonbraun.tgz" "$URL" || fail "could not download $URL"
# No prefix option: npm uses the prefix that is already set.
npm i -g "$tmp/vonbraun.tgz" || fail "npm i -g failed"

echo "vonbraun is installed. Next step: vonbraun init"
