#!/usr/bin/env bash

echo "TOKEN_ENCODED=$TOKEN_ENCODED" > dotenv
git clone https://github.com/flutter/flutter.git -b stable
flutter/bin/flutter upgrade
flutter/bin/flutter build web
