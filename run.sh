#!/usr/bin/env bash
# usage: ./run.sh <source.cpp> [input.txt]
set -euo pipefail

CXX="${CXX:-g++-16}"   # バージョンが違う場合はここを変更
ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$1"
OUT="$ROOT/.bin/a.out"

mkdir -p "$ROOT/.bin"
"$CXX" -std=c++23 -O2 -Wall -Wextra -D_GLIBCXX_DEBUG "$SRC" -o "$OUT"

if [[ $# -ge 2 && -f "$2" ]]; then
  "$OUT" < "$2"
else
  "$OUT"
fi