#!/system/bin/sh
# Magisk v22+ module installer script (sourced by util_functions.sh in BusyBox ash)

ui_print "*******************************************"
ui_print "  Quivira Font Fallback (Android 7.1.2)    "
ui_print "*******************************************"

SRC_XML="/system/etc/fonts.xml"
TARGET_DIR="$MODPATH/system/etc"
FONTS_DIR="$MODPATH/system/fonts"
TARGET_XML="$TARGET_DIR/fonts.xml"
TMP_XML="$TARGET_DIR/fonts.xml.tmp"
FONT_FILE="$FONTS_DIR/Quivira.otf"

# 1. Verify the live system fonts.xml and bundled font exist
if [ ! -f "$SRC_XML" ]; then
  abort "! $SRC_XML not found on this device. Aborting."
fi

if [ ! -f "$FONT_FILE" ]; then
  abort "! Quivira.otf is missing from the module package. Aborting."
fi

# 2. Ensure target overlay directories exist
ui_print "- Preparing module overlay directories..."
mkdir -p "$TARGET_DIR" "$FONTS_DIR" || abort "! Failed to create module directories."

# 3. Copy live /system/etc/fonts.xml into the module overlay
ui_print "- Copying live $SRC_XML..."
cp -f "$SRC_XML" "$TARGET_XML" || abort "! Failed to copy $SRC_XML."

# 4. Idempotency check: skip patching if Quivira.otf is already registered
if grep -q "Quivira.otf" "$TARGET_XML"; then
  ui_print "- Quivira.otf is already present in fonts.xml; skipping patch."
else
  ui_print "- Appending Quivira fallback family before final </familyset>..."

  # Single-pass in-memory awk script works reliably across BusyBox builds on Android 7
  awk '
    { lines[NR] = $0 }
    /<\/familyset>/ { last = NR }
    END {
      if (!last) exit 1
      block = "    <family>\n        <font weight=\"400\" style=\"normal\">Quivira.otf</font>\n    </family>"
      for (i = 1; i <= NR; i++) {
        if (i == last) {
          if (lines[i] ~ /^[ \t\r]*<\/familyset>[ \t\r]*$/) {
            print block
            print lines[i]
          } else {
            sub(/<\/familyset>/, "\n" block "\n&", lines[i])
            print lines[i]
          }
        } else {
          print lines[i]
        }
      }
    }
  ' "$TARGET_XML" > "$TMP_XML" || abort "! Failed to patch fonts.xml (missing </familyset> tag)."

  mv -f "$TMP_XML" "$TARGET_XML" || abort "! Failed to write patched fonts.xml."
fi

# 5. Verify the patched fonts.xml is intact and contains Quivira.otf
if ! grep -q "Quivira.otf" "$TARGET_XML" || ! grep -q "</familyset>" "$TARGET_XML"; then
  abort "! Verification failed: patched fonts.xml is invalid."
fi

# 6. Set standard system font/config permissions (0644)
set_perm "$TARGET_XML" 0 0 0644
set_perm "$FONT_FILE" 0 0 0644

ui_print "- Patched fonts.xml verified successfully."
ui_print "- Reboot your device to activate Quivira fallback glyphs."
