source check_valid_react_native_dir.sh

isRNProjectDirectory

echo "Creating iOS bundle 💻 \n"

rm -rf ios/main.jsbundle \
&& npx react-native bundle --entry-file index.js --platform ios --dev false --bundle-output ios/main.jsbundle --assets-dest ios
