[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart) 

Adaptive drawer package, uses a collapsable menu on bigger screens and the default drawer on smaller screens.

## Setup

Add the package to the pubspec:
```
flutter_adaptive_drawer: ^LATEST_VERSION
```

## How to use

```dart
AdaptiveDrawerScaffold(
    scaffoldBuilder: (
        context, {
        required child,
        required drawer,
        required isSmallScreen,
    }) =>
        Scaffold(
            drawer: drawer,
            appBar: isSmallScreen ? AppBar() : null,
            body: child,
        ),
        drawer: AdaptiveDrawer(
        mainChildren: [],
    ),
    child: const Placeholder(),
);
``` 

Use approach above for the easiest version, this ensures [AdaptiveDrawerService] is injected into the widget tree. [AdaptiveDrawer] can be used without [AdaptiveDrawerScaffold], make sure to place the [AdaptiveDrawerService] inherited widget somewhere in your tree.

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/Iconica-Development/flutter_adaptive_drawer/issues) page. Commercial support is available if you need help with integration with your app or services. You can contact us at [support@iconica.nl](mailto:support@iconica.nl).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](../CONTRIBUTING.md) and send us your [pull request](https://github.com/Iconica-Development/flutter_adaptive_drawer/pulls).

## Author

This flutter_adaptive_drawer for Flutter is developed by [Iconica](https://iconica.nl). You can contact us at <support@iconica.nl>