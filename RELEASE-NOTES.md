# Grandia: Digital Museum — English Translation (Alpha Release)

Hi everyone,

I'm excited to share an AI-assisted fan translation of *Grandia: Digital Museum* for Sega Saturn. I recognize that this may be controversial and if a more polished community effort comes together I will be happy to reference that as the cannonical approach.

I'm a huge fan of the Grandia series but have been unable to fully enjoy my Digital Museum disc due to not being able to read Japanese. This project has enabled me to enjoy the game on my SuperStation One as well as emulators. I hope others can enjoy it too!

**A word of caution (here be dragons):** This is very much an alpha release. It's imperfect, and you should expect crashes, graphical glitches, and untranslated text. Some of the UI and text styles are still fairly janky, but polish and further fixes are in flight. See [KNOWN-ISSUES.md](KNOWN-ISSUES.md) for the current list of known limitations.

However, the core of the museum, dungeons, and menus are explorable. It's been a blast for me to experience it this way, and I wanted to give other fans a chance to do the same, even in this incomplete state. Any issue reports from those playing the game would be appreciated.

### alpha-0.1.0 (2026-07-12) — first community-format patch release

https://www.youtube.com/watch?v=k1NVBCUZcbI
- Renamed release artifacts from internal `rcNN` labels to semantic alpha versions.
- Added a pure-delta `.ssp` and an xdelta3 patch, both built from the current translation build.
- battle arena coming together for comparable look to original Grandia on PSX
- resolved some missing english in menus
- resolved crashes on keycard station
- improved theater display text and buttons to select theater movies
- increased overall stability
- title screen updated with EnigmaUnboxed image


### Project Showcase
***A quick note on the GIFs below:** Many of these were captured during various stages of development using AI assistance (largely by Claude Opus 4.8, with some Fable usage). The final patch has since tightened the release up and translated many of the Japanese text elements you might still see in these animations*

Here is a look at the current state of the project across various parts of the game.

#### Opening Sequence
A fresh **New Game**, cold-booted straight from the patched disc and captured headless in the YMIR emulator: the party tumbles into the museum, comes to, and the intro plays out in English ("Welcome to the Alent Museum!" → "L-Liete!?").

![Opening Sequence](media/00_intro_cinematic.gif)

#### Dialogue & Story
Much of the script and in-game text is now translated, allowing you to follow the story and character interactions.

*Expressions viewer:*
![Sue's Quip](media/01_dialogue_sue_quip.gif)

#### The Museum Galleries
The center of the game is the museum itself, with multiple galleries to explore.

**Theater**
The theater dramas are Japanese-voice-only. We were able to create English subtitles by running the original Japanese audio through an Automatic Speech Recognition (ASR) pipeline to generate a transcript, which was then translated and injected back into the game as timed captions.

*Live subtitle injection:*
![Theater Subtitles](media/06_theater_subtitles_v2.gif)

*Translated theater menus:*
![Theater Menu](media/03_theater_menu.gif)

**Monster Guide**
The monster encyclopedia is now readable in English, with translated names and detailed descriptions. (The stats are still in Japanese, but I will get to that eventually!)

*Navigating the monster list:*
![Monster Book](media/04_monster_book.gif)

**Art & Design Gallery**
The extensive galleries of concept art and character designs are now navigable with translated category menus.

*Scrolling through the main gallery categories:*
![Gallery Categories](media/09_gallery_categories.gif)

#### Casino & Minigames
The various minigames in the game room are also being translated. While all 8 minigame titles are translated, I haven't been able to validate all of them in-game yet. If anyone has a save state with all the minigames unlocked, it would be a huge help, but I'll get there eventually!

*Big-Eater Grandia Cup title screen:*
![Casino Minigame](media/07_casino_game.gif)

*Deck-Swab Remix title screen:*
![Deck-Swab Minigame](media/08_mgame_deckswab.gif)

#### Battle System
Battles are largely functional with translated commands, skills, and enemy names.

*Basic battle commands:*
![Battle Commands](media/02_battle_cmd.gif)

*In-battle skill selection menu:*
![In-Battle Skill Menu](media/14_menu_skill_battle.gif)

#### General Menus & UI
*Item & Equipment Menu:*
![Item Menu](media/05_item_menu.gif)

*Save Game Browser:*
![Save Browser](media/15_menu_save_browser.gif)

*The Moves/Magic growth screen (showing a known visual bug with text cutoff—work in progress!):*
![Moves Growth Menu](media/13_menu_moves_growth.gif)

### How to Help

This project is a labor of love, and community feedback is invaluable. If you encounter bugs, translation issues, or graphical glitches, please report them.

**[→ Open a new issue](../../issues/new/choose)** — it opens a short form that walks you through what helps most (a screenshot and a zipped savestate from right at the failing spot). See [KNOWN-ISSUES.md](KNOWN-ISSUES.md) first to check whether it's already tracked.

Happy Gaming!
