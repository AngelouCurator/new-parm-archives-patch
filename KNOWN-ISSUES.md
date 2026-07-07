# Known issues & untested areas

This is an alpha, work-in-progress patch by one person (well, one person and an AI). The list
below is what I already know about — **please still report anything you hit**, especially with a
savestate, even if it's on this list (it helps confirm severity and reproduction). To file one,
**[→ open a new issue](../../issues/new/choose)**; a short form walks you through it.

> ⚠️ **Use at your own risk.** I'm not responsible for any save corruption, lost progress, or
> other issues that result from using this patch.

## Crashes & stability

- **Crashes** — expect some. Crash reports are genuinely useful and I do look at them, so please
  file them. **A savestate from just before the crash is gold.**
- *(The older title-screen "attract mode" freeze — the title screen crashing if you waited too
  long on it — was addressed in this build. If you still see it, please report it.)*

## Untested / partially-verified content

- **Minigames** — all 8 minigame titles are translated, but not all of them have been unlocked in
  testing, so the translated text in the ones later in the game may not have been seen in-game yet.
  A savestate with all minigames unlocked would be a huge help.
- **The Theater** — not fully unlocked either, so some captions there may be untranslated or have
  **off timing** (text appearing too early or too late).

## Untranslated pockets

- A few menus/areas were left in Japanese where the format was too hard to crack — for example, the
  **monster-book stat panel** (monster stats are still in Japanese). These are known and I'll get
  to them over time. If you find an untranslated pocket that isn't listed here, please report it.

## Known visual bugs

- **Moves/Magic growth screen** — a text-cutoff issue on that screen is known and being worked on.
- General **graphical glitches** and some **janky UI/text styling** remain in places; polish is
  in flight.

## What helps most in a report

- 💾 **A savestate** taken right at the failing spot, from whichever emulator you use.
  ⚠️ GitHub won't accept a raw `.savestate` — **zip it first**, then attach the `.zip`.
- 🕹️ **Which emulator** (and version) the savestate is from — each emulator's state format differs.
- 📷 **A screenshot** of the problem.
- 📝 **A description**: what you expected vs. what you actually saw, where it happened, and the
  patch version (the `rcNN` in the patch filename).
