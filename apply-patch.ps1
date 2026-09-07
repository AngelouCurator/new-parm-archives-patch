param(
    [Parameter(Mandatory = $true)][string]$SourceTrack1,
    [Parameter(Mandatory = $false)][string]$SourceTrack2
)

$ErrorActionPreference = "Stop"
$Patch = Join-Path $PSScriptRoot "Grandia-DM-EN-alpha-0.2.0.Track1.xdelta3"
$SourceMd5 = "59b19105615ca37886e1e0542ff2967e"
$OutputMd5 = "933c380f4d31aff22a191ca3cadd6532"
$OutputDir = Join-Path $PSScriptRoot "patched"
$OutputTrack = Join-Path $OutputDir "Track1.bin"

if (-not (Get-Command xdelta3 -ErrorAction SilentlyContinue)) {
    throw "xdelta3 is required and was not found on PATH."
}

$ActualSourceMd5 = (Get-FileHash -Algorithm MD5 $SourceTrack1).Hash.ToLowerInvariant()
if ($ActualSourceMd5 -ne $SourceMd5) {
    throw "Source Track 1 MD5 mismatch: $ActualSourceMd5 (expected $SourceMd5)"
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
& xdelta3 -d -f -B 800000000 -s $SourceTrack1 $Patch $OutputTrack
if ($LASTEXITCODE -ne 0) { throw "xdelta3 failed with exit code $LASTEXITCODE" }

$ActualOutputMd5 = (Get-FileHash -Algorithm MD5 $OutputTrack).Hash.ToLowerInvariant()
if ($ActualOutputMd5 -ne $OutputMd5) {
    throw "Patched Track 1 MD5 mismatch: $ActualOutputMd5 (expected $OutputMd5)"
}

if ($SourceTrack2) {
    Copy-Item -Force $SourceTrack2 (Join-Path $OutputDir "Track2.bin")
}

$Cue = @'
FILE "Track1.bin" BINARY
  TRACK 01 MODE1/2352
    INDEX 01 00:00:00
FILE "Track2.bin" BINARY
  TRACK 02 AUDIO
    INDEX 00 00:00:00
    INDEX 01 00:02:00
'@
Set-Content -Encoding Ascii (Join-Path $OutputDir "Grandia-DM-EN.cue") $Cue

Write-Host "Patch applied and verified: $OutputTrack"
if (-not $SourceTrack2) {
    Write-Host "Copy your original Track 2 to patched/Track2.bin before loading the cue."
}
