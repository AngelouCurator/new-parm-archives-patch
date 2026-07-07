# Grandia: Digital Museum — English Translation Patch

A fan translation of *Grandia: Digital Museum* (Sega Saturn, Japan-only) from Japanese to English.

## Motivation

This is passion project with the primary goal of finally playing my personal grandia digital museum backup in english on a superstation one. Sharing it in case it lets you do the same. **Happy gaming!** 🎮

I had a secondary goal of a toy AI learning experiment where I explore a agent driven emulator harness and validation loop (having an AI agent reverse-engineer disc/text formats, inject text, and verify its own work in an emulator loop). This was surprisingly effective.


## What's in here

Just the patch — a binary `xdelta3` delta and instructions. **No game data is included.** This
repo deliberately ships no disc image, no game text, and no copyrighted assets. You must supply
your own dump of the Japanese *Digital Museum* disc.

See **[RELEASE-NOTES.md](RELEASE-NOTES.md)** for a showcase of what's translated (with GIFs) and
the technical approach, and **[KNOWN-ISSUES.md](KNOWN-ISSUES.md)** for current limitations.

## Applying the patch

You need: your own Japanese *Digital Museum* disc image (the Track 1 `.bin` the patch targets) and
[`xdelta3`](https://github.com/jmacd/xdelta).

```bash
xdelta3 -d -s "Your-Japanese-Track1.bin" Grandia-DM-EN-rc48.Track1.xdelta3 "Grandia-DM-EN-Track1.bin"
```

Then rebuild/mount the `.cue` with the patched Track 1 and run it in a Saturn emulator (developed
and verified against **YMIR**). If the patch refuses to apply, your source track doesn't match the
expected disc — see *Reporting issues* below.

## Known limitations & untested areas

This is a work in progress. Some parts aren't fully verified — **a savestate near any of these is especially helpful** if you hit a problem:

- **Minigames** — not all of them have been unlocked in my saves, so the translated text in the
  ones later in the game may not have been seen in-game yet.
- **The Theater** — not fully unlocked in my saves either, so some captions there may be untranslated or have
  **off timing** (text appearing too early/late).
- **Crashes** — expect some. ⚠️ **I'm not responsible for any save corruption, lost progress, or
  other issues that result from using this patch — use it at your own risk.** That said, **crash
  reports are genuinely useful** and I do look at them, so please file them (a savestate from just
  before the crash is gold).
- **Untranslated pockets** — a few menus/areas were left in Japanese where the format was too hard
  to crack (for example, the **monster-book stat panel**). These are known and I'll get to them
  over time but if you find one I haven't listed, please report it.

## Reporting issues

Bug reports are very welcome. **[→ Open a new issue](../../issues/new/choose)** — it opens a
short form that walks you through it. The four things that help most:

- 💾 **A savestate** taken right at the failing spot, from whichever emulator you use.
  ⚠️ GitHub won't accept a raw `.savestate` — **zip it first**, then attach the `.zip`.
- 🕹️ **Which emulator** (and version) the savestate is from — each emulator's state format differs,
  so this is essential for me to load it.
- 📷 **A screenshot** of the problem.
- 📝 **A description**: what you expected vs. what you actually saw, where it happened, and the
  patch version (the `rcNN` in the filename).

Clear, specific, reproducible reports get fixed fastest. Thank you for helping make this project better.

## Acknowledgments

Deep thanks to **[TrekkiesUnite118](https://github.com/TrekkiesUnite118)** and the upstream Grandia
translation methods — the reverse-engineering of the Saturn disc/text formats, fonts, and
control codes (documented on their
[wiki](https://github.com/TrekkiesUnite118/GrandiaTranslation/wiki)) that this project's pipeline
builds on. This patch stands on that groundwork and would not exist without it.

## Legal

This is an unofficial fan project, not affiliated with or endorsed by the rights holders. It
contains no copyrighted game data — only a patch you apply to a copy you already own. If you
represent the rights holders and have concerns, open an issue and I'll respond promptly.

The original text and documentation in this repository are licensed under the MIT License
(see [`LICENSE`](LICENSE)); third-party attributions are in [`NOTICE`](NOTICE).
