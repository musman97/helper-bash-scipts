source check_valid_react_native_dir.sh

isRNProjectDirectory

# Find the first .xcproj file in the current directory
project_file=$(find ios -maxdepth 1 -type d -name "*.xcproj" | head -n 1)

if [ -z "$project_file" ]; then
  echo "No Xcode project files (.xcproj) found in the current directory."
  exit 1
fi

# Use the "open" command to open the Xcode workspace
open "$project_file"
