# Animated Notch Bottom Bar

A Flutter package for animating the position of selected item in bottomNavigationBar with notch like design. Inspired by [react-native-tabbar-interaction](https://github.com/Mindinventory/react-native-tabbar-interaction) plugin.

## Features :
* Supports any widget as as a bottom bar children.
* Animates the notch toward selected item.
* Create an optimized bottom navigation bar with beautiful animation.
* Supports blur effect like iOS Tab View.


## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  animated_notch_bottom_bar: ^0.0.1
```
## Basic Usage

#### Place `NotchBottomBar` in the bottomNavigationBar parameter of a `Scaffold` widget.
```dart
bottomNavigationBar:  NotchBottomBar(
  ...
            )
```

#### Provide `PageController` to `NotchBottomBar`:
```dart
bottomNavigationBar:  NotchBottomBar(
 pageController: _pageController,
  ...
)
```
