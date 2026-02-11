#!/bin/bash

set -e

BIN="$HOME/.local/bin"
mkdir -p "$BIN"

# ---- celluloid en Sway (Wayland) ----
cat > "$BIN/celluloid-sway" << 'EOF'
#!/bin/sh
export GDK_BACKEND=wayland
exec /usr/bin/celluloid "$@"
EOF

chmod +x "$BIN/celluloid-sway"

# ---- VLC en Sway (XWayland) ----
cat > "$BIN/vlc-sway" << 'EOF'
#!/bin/sh
export DISPLAY=:0
exec /usr/bin/vlc --vout=x11 "$@"
EOF

chmod +x "$BIN/vlc-sway"

echo "✅ Wrappers creados correctamente:"
echo "  - $BIN/celluloid-sway"
echo "  - $BIN/vlc-sway"
echo ""
echo "👉 Uso:"
echo "   celluloid-sway 01.mp4"
echo "   vlc-sway 01.mp4"
