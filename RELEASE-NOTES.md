# Grandia: Digital Museum — English Translation alpha-0.2.1

A bug-fix update to alpha-0.2.0. Thanks to the players who reported these.

## Fixes since alpha-0.2.0

- **Freeze before the Officers' Room boss fight.** Entering the Officers' Room in Garlyle Base
  Block 2 showed a garbled box and hung instead of playing the Mullen/Baal scene. The scene now
  plays and the battle starts ([issue #1](https://github.com/AngelouCurator/new-parm-archives-patch/issues/1)).
  The same fix also corrects 15 similar branch jumps in Parm's town scripts; those were caught by
  the build check rather than seen in play.
- **Item-use banner in battle.** Using an item showed another item's stats in the top banner
  (for example "ATK+80, Skill power+1") instead of the item's name. It now shows the name.
- **Stray Japanese character after door names.** Door previews showed a Japanese へ after the
  English destination ("Garlyle Base - Entrance へ"). It is removed, matching the English Grandia.

See `KNOWN-ISSUES.md` for what is still open.

## Artifacts

Both included patches apply only to the Redump Rev A 10M image whose Track 1 MD5 is
`59b19105615ca37886e1e0542ff2967e`:

- `Grandia-DM-EN-alpha-0.2.1.ssp` — Sega Saturn Patcher archive for the original `.cue`.
- `Grandia-DM-EN-alpha-0.2.1.Track1.xdelta3` — Track 1 delta for xdelta3 and the included scripts.

The SSP contains 107 binary-delta file changes and has been verified against the alpha-0.2.1
reference build. The xdelta decodes byte-for-byte to that same build.

---

# alpha-0.2.0

This is the version I have been playing on and off over the past month. I will continue to
iterate on it as I have time.

## Changes since alpha-0.1.0

- **Broader translation coverage.** The story, narration, incidental dialogue, museum exhibits,
  fixed-image labels, menus, and system screens received additional translation work.
- **Battle overhaul.** English coverage now includes command rings, action banners, character and
  enemy names, skills, magic, tactics, defense options, item descriptions, battle-result screens,
  and the strategy interface. The previous action-banner text mismatch and the Burnflare selection
  crash were corrected.
- **Post-battle and growth screens.** Result-screen character names, stat labels, skill-gain rows,
  and growth-menu layout were revised for readable English presentation.
- **Museum collections.** The Monster Guide now has English names, habitats, stats, and detail
  labels. The Design Materials and Expressions galleries gained translated navigation, prompts,
  labels, and character quips. The save-data browser is translated as well.
- **Theater.** The Japanese-voiced dramas use English captions, with theater menu and playback UI
  improvements. Further caption alignment will be done once all dramas are unlocked for full
  testing. Sorry for the delay—life gets busy sometimes.
- **Minigames.** All eight games were unlocked and validated in-game; menus, gameplay text, and
  relevant title/label art received translation work.
- **Compatibility and stability.** The patch includes the late crash, stale-pointer, overflow, font, and layout fixes.

See `KNOWN-ISSUES.md` for the remaining battle arrow artifact and untranslated level-up/counter
messages, plus the smaller acceptance notes still open for this alpha.

## Candidate artifacts

Both included patches apply only to the Redump Rev A 10M image whose Track 1 MD5 is
`59b19105615ca37886e1e0542ff2967e`:

- `Grandia-DM-EN-alpha-0.2.0.ssp` — Sega Saturn Patcher archive for the original `.cue`.
- `Grandia-DM-EN-alpha-0.2.0.Track1.xdelta3` — Track 1 delta for xdelta3 and the included scripts.

The SSP contains 107 binary-delta file changes and has been reconstructed and verified against
the alpha-0.2.0 reference build. The xdelta decodes byte-for-byte to that same build.
