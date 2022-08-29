# Animated Notch Bottom Bar

A Flutter package for animating the position of selected item in bottomNavigationBar with notch like design. Inspired by [react-native-tabbar-interaction](https://github.com/Mindinventory/react-native-tabbar-interaction) plugin.

## Features :
* Supports blur effect like iOS Tab View.
* Supports any widget as as a bottom bar children.
* Animates the notch toward selected item.
* Create an optimized bottom navigation bar with beautiful animation.

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  bottom_navy_bar: ^5.6.0
```
## Basic Usage

Place `NotchBottomBar` in the bottomNavigationBar parameter of a `Scaffold` widget.
```dart
bottomNavigationBar:  NotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              bottomBarItems: [
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.star,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.star,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
```

Provide `PageController` to `NotchBottomBar`
```dart
bottomNavigationBar:  NotchBottomBar(
 pageController: _pageController,
  ...
)
```
