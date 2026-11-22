# Quivira Font Fallback (Magisk Module)

A tiny, systemless Magisk module that fixes "tofu" boxes (□) for Unicode characters your Android device's default font cannot render — specifically **Mathematical Alphanumeric Symbols** (e.g. `𝚆𝙷𝙸𝚃𝙴 𝙼𝙰𝙶𝙸𝙲𝙸𝙰𝙽𝚂`) and **Dingbats / Ornamental Dingbats** (e.g. `✿ ♡ ◦ • ●`).

It works by injecting the [Quivira](https://www.quivira-font.com/) font as a **last-resort fallback** in `fonts.xml`. Your normal text is **not** changed — the new font is only consulted when the primary font is missing a glyph.

## Requirements

- **Android 7.0 – 7.1.2** (tested on Samsung SM-J201F, custom ROM, Android 7.1.2)
- **Magisk v22 or newer** (no Zygisk required)
- A custom recovery or Magisk's built-in uninstaller as a safety net (see *Recovery* below)

## What it does

1. On install, `customize.sh` copies your device's live `/system/etc/fonts.xml` into the module directory.
2. It appends a new `<family>` block referencing `Quivira.ttf` immediately before the final `</familyset>` tag.
3. Magisk overlays the patched `fonts.xml` and the `Quivira.ttf` file systemlessly at boot.

Nothing under `/system` is modified permanently. Removing the module in Magisk restores the original state after a reboot.

## Build (GitHub Actions, browser-only)

This repo builds itself. You do not need a PC.

1. Go to the **Actions** tab.
2. Select **Build Magisk Module** in the left sidebar.
3. Click **Run workflow** → **Run workflow**.
4. When the run finishes (green check), open it and scroll to **Artifacts**.
5. Download `Quivira-Fallback-Module.zip` and extract the inner ZIP on your phone or PC.

## Install

1. Copy the extracted `Quivira-Fallback.zip` to your phone.
2. Open **Magisk** → **Modules** → **Install from storage**.
3. Select the ZIP and wait for the installer to finish.
4. Reboot.

## Verify

Open any app that previously showed boxes and paste the test string:
