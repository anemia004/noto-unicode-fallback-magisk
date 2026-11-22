# Quivira Font Fallback (Magisk Module)

Fixes "tofu" boxes (□) for Mathematical Alphanumeric Symbols (`𝚆𝙷𝙸𝚃𝙴`) and Dingbats (`✿ ♡ ◦ • ●`) by adding [Quivira](https://www.quivira-font.com/) as a last-resort fallback in `fonts.xml`. Normal text is unchanged.

## Requirements
- Android 7.0–7.1.2 (tested on SM-J201F)
- Magisk v22+

## Build (browser-only)
1. **Actions** tab → **Build Magisk Module** → **Run workflow**.
2. Open the finished run → **Artifacts** → download `Quivira-Fallback-Module.zip`.
3. Extract the inner ZIP.

## Install
Magisk → Modules → Install from storage → select ZIP → reboot.

## Verify
Paste this anywhere: `𝚆𝙷𝙸𝚃𝙴 𝙼𝙰𝙶𝙸𝙲𝙸𝙰𝙽𝚂 ✿ ♡ ◦ • ●` — all characters should render.

## Recovery
If it bootloops: disable the module in Magisk, or from recovery delete `/data/adb/modules/quivira_fallback/`, or run `adb shell magisk --remove-modules`. Keep a Magisk uninstaller ZIP handy.

## License
MIT. `Quivira.ttf` is public domain, © Alexander Lange — https://www.quivira-font.com/
