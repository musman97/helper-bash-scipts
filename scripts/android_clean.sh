source check_valid_react_native_dir.sh

isRNProjectDirectory

current_dir=$(pwd)

cd android
chmod u+x gradlew
./gradlew clean

cd "$current_dir"