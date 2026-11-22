# Noto Unicode Fallback (Magisk Module)

A systemless Magisk module that adds Google's **Noto Sans Math** and **Noto Sans Symbols 2** as fallback fonts. Normal text is unchanged. Useful for older devices where certain Unicode symbols and mathematical characters render as boxes (□).

## Requirements
- Android 7.0+ (LineageOS / AOSP-based ROMs recommended)
- Magisk v22+

## Download
1. Open the **Releases** section on the right sidebar of this repository.
2. Download **`Noto-Unicode-Fallback.zip`** directly (do not extract it).

## Install
Magisk → Modules → Install from storage → select the ZIP → reboot.

## Recovery
If it bootloops: disable the module in Magisk, or from recovery delete `/data/adb/modules/noto_unicode_fallback/`, or run `adb shell magisk --remove-modules`. Keep a Magisk uninstaller ZIP handy.

## Build (browser-only)
Push to `main` or run **Actions → Build and Release Magisk Module → Run workflow**. The workflow downloads both fonts from Google's official repository, verifies them, packages the ZIP, and publishes it to Releases automatically.

## License
MIT for the module code. `NotoSansMath-Regular.ttf` and `NotoSansSymbols2-Regular.ttf` are part of Google Noto Fonts, licensed under the SIL Open Font License 1.1 — https://fonts.google.com/noto
