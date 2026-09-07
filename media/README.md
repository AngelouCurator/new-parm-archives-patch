# README showcase captures

Native 352x224 GIF captures for the public patch README. Most were generated from registered
YMIR savestates with `tools/capture_showcase.py`; raw PNG frames and reports are written to the
gitignored `work/showcase/` directory. The theater-caption GIF was assembled from the most recent
centered-caption validation run because loading a later mid-drama state retained stale hook RAM.

The numbered files are ordered for the showcase in `README-PATCH-DRAFT.md`. Files 14-21 cover
all eight minigames individually. The capture set intentionally includes a few additional views
that the draft may not embed, so the release README can be edited without another emulator
session.

Regenerate the full set from an existing release-candidate build:

```bash
python3 tools/capture_showcase.py --attempt rc_55
```

Set `GDM_BIOS` if the BIOS is not in one of the local development paths detected by the script.
