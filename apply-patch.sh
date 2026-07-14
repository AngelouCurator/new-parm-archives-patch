#!/usr/bin/env bash
# Apply the Grandia: Digital Museum English patch and assemble a ready-to-play disc folder.
#
# This is the XDELTA path (macOS/Linux). It outputs BIN/CUE and reproduces the reference
# Track 1 byte for byte. The preferred path is Sega Saturn Patcher (.ssp) — see README.md.
#
# Usage:
#   ./apply-patch.sh "path/to/Grandia - Digital Museum (Japan) (Rev A) (10M) (Track 1).bin" \
#                    "path/to/Grandia - Digital Museum (Japan) (Rev A) (10M) (Track 2).bin" \
#                    [output-dir]
#
# Source disc: Redump "Grandia - Digital Museum (Japan) (Rev A) (10M)", Track 1 MODE1/2352.
#
# Produces <output-dir>/ (default: ./patched) containing:
#   Track1.bin                 the patched English data track
#   Track2.bin                 your original audio track, copied unmodified
#   Grandia-DM-EN.cue          cue sheet referencing both
#
# OUTPUT FORMAT: this script only produces BIN/CUE — right for emulators, MODE/Satiator/Fenrir,
# and CD-R burning. Rhea/Phoebe ODEs want CCD/IMG: use Sega Saturn Patcher (Windows)
# select CCD/IMG output, with "Separate Track Files" enabled (this is a 2-track disc).

set -euo pipefail

PATCH="Grandia-DM-EN-alpha-0.1.0.Track1.xdelta3"
SRC_MD5="59b19105615ca37886e1e0542ff2967e"   # expected original JP Track 1 (Rev A)
OUT_MD5="0188783aed16c167c7c27d196863fdbb"   # expected patched Track 1

usage() {  # reprint this file's header block: comment lines after the shebang, up to the first
    awk 'NR>1 { if (!/^#/) exit; sub(/^# ?/, ""); print }' "$0"   # non-comment line
}

if [ $# -lt 2 ]; then
    usage
    exit 2
fi
TRACK1_SRC=$1
TRACK2_SRC=$2
OUTDIR=${3:-patched}

cd "$(dirname "$0")"
[ -f "$PATCH" ]      || { echo "ERROR: $PATCH not found next to this script" >&2; exit 1; }
[ -f "$TRACK1_SRC" ] || { echo "ERROR: Track 1 not found: $TRACK1_SRC" >&2; exit 1; }
[ -f "$TRACK2_SRC" ] || { echo "ERROR: Track 2 not found: $TRACK2_SRC" >&2; exit 1; }
command -v xdelta3 >/dev/null || { echo "ERROR: xdelta3 is not installed" >&2; exit 1; }

md5of() {  # portable md5 (macOS: md5, Linux: md5sum)
    if command -v md5 >/dev/null; then md5 -q "$1"
    elif command -v md5sum >/dev/null; then md5sum "$1" | cut -d' ' -f1
    else echo "(md5 tool not found — skipping verification)"; fi
}

echo "==> Verifying source dump..."
got=$(md5of "$TRACK1_SRC")
if [ "$got" = "$SRC_MD5" ]; then
    echo "    OK: $got"
elif [[ "$got" == "("* ]]; then
    echo "    $got"
else
    echo "    WARNING: source md5 is $got, expected $SRC_MD5" >&2
    echo "    Your dump is not the expected 'Rev A (10M)' Track 1 — the patch may refuse to apply." >&2
fi

mkdir -p "$OUTDIR"
echo "==> Applying $PATCH..."
xdelta3 -d -f -B 800000000 -s "$TRACK1_SRC" "$PATCH" "$OUTDIR/Track1.bin"

echo "==> Verifying patched track..."
got=$(md5of "$OUTDIR/Track1.bin")
if [ "$got" = "$OUT_MD5" ]; then
    echo "    OK: $got"
elif [[ "$got" == "("* ]]; then
    echo "    $got"
else
    echo "    ERROR: patched md5 is $got, expected $OUT_MD5" >&2
    exit 1
fi

echo "==> Copying audio track..."
cp "$TRACK2_SRC" "$OUTDIR/Track2.bin"

echo "==> Writing cue sheet..."
cat > "$OUTDIR/Grandia-DM-EN.cue" <<'EOF'
FILE "Track1.bin" BINARY
  TRACK 01 MODE1/2352
    INDEX 01 00:00:00
FILE "Track2.bin" BINARY
  TRACK 02 AUDIO
    INDEX 00 00:00:00
    INDEX 01 00:02:00
EOF

cat <<EOF

Done. Load $OUTDIR/Grandia-DM-EN.cue in your Saturn emulator. Happy gaming!

  Emulator / MODE / Satiator / Fenrir : use the .cue above as-is.
  CD-R                                : burn the .cue (not the .bin) in raw mode.
  Rhea / Phoebe ODE                   : these want CCD/IMG, which this script does not
                                        produce. Use Sega Saturn Patcher (or the
                                        cross-platform saturn-patcher-egui) with the .ssp
                                        and select CCD/IMG output. See README.md.

Cold-boot the disc the first time — the game rebuilds its file index from the ISO directory
only at boot, so loading an old savestate from a different build can mis-resolve files.
EOF
