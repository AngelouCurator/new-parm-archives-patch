#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PATCH="$SCRIPT_DIR/Grandia-DM-EN-alpha-0.2.0.Track1.xdelta3"
OUTPUT_DIR="$SCRIPT_DIR/patched"
SOURCE_MD5='59b19105615ca37886e1e0542ff2967e'
OUTPUT_MD5='933c380f4d31aff22a191ca3cadd6532'

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 SOURCE_TRACK1.bin [SOURCE_TRACK2.bin]" >&2
  exit 2
fi

if ! command -v xdelta3 >/dev/null 2>&1; then
  echo "xdelta3 is required and was not found on PATH." >&2
  exit 1
fi

md5_file() {
  if command -v md5sum >/dev/null 2>&1; then
    md5sum "$1" | awk '{print $1}'
  elif command -v md5 >/dev/null 2>&1; then
    md5 -q "$1"
  else
    echo "An md5 or md5sum command is required." >&2
    exit 1
  fi
}

source_track=$1
source_hash=$(md5_file "$source_track")
if [ "$source_hash" != "$SOURCE_MD5" ]; then
  echo "Source Track 1 MD5 mismatch: $source_hash" >&2
  echo "Expected: $SOURCE_MD5" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"
xdelta3 -d -f -B 800000000 -s "$source_track" "$PATCH" "$OUTPUT_DIR/Track1.bin"

output_hash=$(md5_file "$OUTPUT_DIR/Track1.bin")
if [ "$output_hash" != "$OUTPUT_MD5" ]; then
  echo "Patched Track 1 MD5 mismatch: $output_hash" >&2
  echo "Expected: $OUTPUT_MD5" >&2
  exit 1
fi

if [ "$#" -eq 2 ]; then
  cp "$2" "$OUTPUT_DIR/Track2.bin"
fi

{
  echo 'FILE "Track1.bin" BINARY'
  echo '  TRACK 01 MODE1/2352'
  echo '    INDEX 01 00:00:00'
  echo 'FILE "Track2.bin" BINARY'
  echo '  TRACK 02 AUDIO'
  echo '    INDEX 00 00:00:00'
  echo '    INDEX 01 00:02:00'
} > "$OUTPUT_DIR/Grandia-DM-EN.cue"

echo "Patch applied and verified: $OUTPUT_DIR/Track1.bin"
if [ "$#" -eq 1 ]; then
  echo "Copy your original Track 2 to patched/Track2.bin before loading the cue."
fi
