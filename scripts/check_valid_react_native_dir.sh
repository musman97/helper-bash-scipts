#!/bin/bash

function isRNProjectDirectory() {
    if [ ! -f "package.json" ] && [ ! -f "android" ] && [ ! -f "ios" ]; then
        echo "🛑 Please run this command at the root of your react native project";
        exit 1;
    fi
}