# Noto Unicode Fallback (Magisk Module)

A systemless Magisk module that adds Google's **Noto Sans Math** and **Noto Sans Symbols 2** as fallback fonts. Normal text is unchanged. Useful for older devices where certain Unicode symbols and mathematical characters render as boxes (□).

## Requirements
- Android 7.0+ (stock OEM or AOSP/LineageOS-based ROMs with standard `/system/etc/fonts.xml` fallback slots)
- Magisk v22+

## Download
1. Open the **Releases** section on the right sidebar of this repository.
2. Download the latest **`Noto-Unicode-Fallback-v1.x.zip`** directly (do not extract it).

## Install
1. Open **Magisk → Modules → Install from storage**.
2. Select the downloaded ZIP and reboot.

## Recovery
If anything goes wrong: disable or remove the module in Magisk, delete `/data/adb/modules/noto_unicode_fallback/` from recovery, or run `adb shell magisk --remove-modules`.

## License
MIT for the module code. `NotoSansMath-Regular.ttf` and `NotoSansSymbols2-Regular.ttf` are part of Google Noto Fonts, licensed under the SIL Open Font License 1.1 (`LICENSE_OFL.txt` included in the release ZIP) — https://fonts.google.com/noto
