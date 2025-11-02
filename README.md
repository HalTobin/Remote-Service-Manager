# RemoteServiceManager

Simple app to administrate services on a remote server through SSH

## About this project

This project is made with Flutter/Dart, and targets:
- Windows
- MacOS
- Linux
- Android
- iOS

### Libraries

This project works thanks to these libraries:
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
- [provider](https://pub.dev/packages/provider)
- [path_provider](https://pub.dev/packages/path_provider)
- [file_picker](https://pub.dev/packages/file_picker)
- [dartssh2](https://pub.dev/packages/dartssh2)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [drift](https://pub.dev/packages/drift)

## Getting Started

### Drift's database configuration

The Drift's database requires some simple configuration to work.
Open your terminal, navigate to the project's directory and then run one of this command:

If this is the first time opening the project:
```dart run build_runner build```

If you've already run the configuration command before and updated the database structure:
```dart run build_runner watch```
