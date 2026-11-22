#!/system/bin/sh
# Magisk module installer — populates native system fallback font slots without modifying fonts.xml

ui_print "*******************************************"
ui_print "       Noto Unicode Fallback Module        "
ui_print "*******************************************"

MATH_FONT="$MODPATH/system/fonts/DroidSansFallback.ttf"
SYM_FONT="$MODPATH/system/fonts/NotoSansSymbols-Regular-Subsetted2.ttf"

for f in "$MATH_FONT" "$SYM_FONT"; do
  if [ ! -s "$f" ]; then
    abort "! Missing or empty font file: $(basename "$f"). Aborting."
  fi
done

if [ -f "/system/etc/fonts.xml" ]; then
  if ! grep -q "DroidSansFallback.ttf" /system/etc/fonts.xml; then
    abort "! DroidSansFallback.ttf slot not found in /system/etc/fonts.xml."
  fi
  if ! grep -q "NotoSansSymbols-Regular-Subsetted2.ttf" /system/etc/fonts.xml; then
    abort "! NotoSansSymbols-Regular-Subsetted2.ttf slot not found in /system/etc/fonts.xml."
  fi
fi

ui_print "- Verified system fallback font slots."
ui_print "- Applying permissions and SELinux labels..."

set_perm_recursive "$MODPATH/system" 0 0 0755 0644 u:object_r:system_file:s0

ui_print "- Installation complete. Reboot to apply."
