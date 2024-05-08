#!/bin/bash

# Directory where scripts will be installed
SCRIPTS_DIR="$HOME/scripts"

# Directory where repo will be temporarily downloaded
DOWNLOAD_DIR=$(mktemp -d)

INSTALL_DIR="$HOME/scripts"

git clone https://github.com/musman97/helper-bash-scipts.git "$DOWNLOAD_DIR"

cp -R $DOWNLOAD_DIR/scripts $HOME/

chmod -R u+x "$INSTALL_DIR"

# Detect the shell being used
SHELL_CONFIG_FILE=""
if [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG_FILE="$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG_FILE="$HOME/.zshrc"
else
    # Use a default value if the shell is not recognized
    SHELL_CONFIG_FILE="$HOME/.profile"
fi

# Add installation directory to shell config file if not already present
if [ -n "$SHELL_CONFIG_FILE" ] && ! grep -qF "export PATH=\"$INSTALL_DIR:" "$SHELL_CONFIG_FILE"; then
    echo "\n#Add helper scripts to PATH\n" >> "$SHELL_CONFIG_FILE"
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_CONFIG_FILE"
    source "$SHELL_CONFIG_FILE"  # Update current shell with new PATH
fi
