#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${INSTALL_DIR:-$HOME/bin}"
CMD_NAME="apicheck"

mkdir -p "$INSTALL_DIR"
ln -sf "$SCRIPT_DIR/apicheck" "$INSTALL_DIR/$CMD_NAME"

# Add ~/bin to PATH if needed
SHELL_RC=""
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q 'export PATH="\$HOME/bin:\$PATH"' "$SHELL_RC" 2>/dev/null; then
        echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_RC"
        echo "已添加 ~/bin 到 PATH ($SHELL_RC)"
    fi
fi

echo "✅ apicheck 已安装到 $INSTALL_DIR/$CMD_NAME"
echo "   运行: $CMD_NAME --help"
