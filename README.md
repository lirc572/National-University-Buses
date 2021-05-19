# National University Buses

[![Tests](https://github.com/lirc572/National-University-Buses/workflows/Tests/badge.svg)](https://github.com/lirc572/National-University-Buses/actions/workflows/tests.yml)
[![Android Release](https://github.com/lirc572/National-University-Buses/workflows/Android%20Release/badge.svg)](https://github.com/lirc572/National-University-Buses/actions/workflows/android-release.yml)
[![Web Release](https://github.com/lirc572/National-University-Buses/workflows/Web%20Release/badge.svg)](https://github.com/lirc572/National-University-Buses/actions/workflows/web-release.yml)

An app that displays NUS bus information.

## Development

### Getting Started

1. Create a `dotenv` file with the encoded token (`TOKEN_ENCODED=***`)

> `dotenv` is used because a file named `.env` can't be served by most static site hosting platforms. Currently there is no good way to read environment variables in Flutter Web. If you have any good idea, please propose in [Issues](https://github.com/lirc572/National-University-Buses/issues)!

2. Run `flutter run`

### Commit Messages

We follow [pvdlg/conventional-changelog-metahub](https://github.com/pvdlg/conventional-changelog-metahub#commit-types) for Git commit types.

## Change App Icon

1. Update `assets/images/icon.png`
2. Run `flutter pub run flutter_launcher_icons:main`
