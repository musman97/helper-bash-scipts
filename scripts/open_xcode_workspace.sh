source check_valid_react_native_dir.sh

isRNProjectDirectory

# Find the first .xcworkspace file in the current directory
workspace_file=$(find ios -maxdepth 1 -type d -name "*.xcworkspace" | head -n 1)

if [ -z "$workspace_file" ]; then
  echo "No Xcode workspace files (.xcworkspace) found in the current directory."
  exit 1
fi

# Use the "open" command to open the Xcode workspace
open "$workspace_file"
