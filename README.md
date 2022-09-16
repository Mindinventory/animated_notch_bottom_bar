# Animated Notch Bottom Bar
<a href="https://pub.dev/packages/animated_notch_bottom_bar"><img src="https://img.shields.io/pub/v/animated_notch_bottom_bar.svg?label=animated_notch_bottom_bar" alt="animated_notch_bottom_bar version"></a>
<a href="https://flutter.dev/"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
<a href="https://dart.dev"><img src="https://img.shields.io/badge/dart-website-deepskyblue.svg" alt="Dart Website"></a>
<a href="https://developer.android.com" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-android-blue">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-blue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Web-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Mac-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Linux-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Windows-deepskyblue">
</a>
<a href=""><img src="https://app.codacy.com/project/badge/Grade/dc683c9cc61b499fa7cdbf54e4d9ff35"/></a>
<a href="https://github.com/Mindinventory/animated_notch_bottom_bar/blob/main/LICENSE" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/github/license/Mindinventory/animated_notch_bottom_bar"></a>
<a href="https://pub.dev/packages/animated_notch_bottom_bar"></a>
<a href="https://github.com/Mindinventory/animated_notch_bottom_bar"><img src="https://img.shields.io/github/stars/Mindinventory/animated_notch_bottom_bar?style=social" alt="MIT License"></a>

A Flutter package for animating the position of selected item in bottomNavigationBar with notch like design. Inspired by [react-native-tabbar-interaction](https://github.com/Mindinventory/react-native-tabbar-interaction) plugin.

## Features :
* Supports any widget as as a bottom bar children.
* Animates the notch toward selected item.
* Create an optimized bottom navigation bar with beautiful animation.
* Supports blur effect like iOS Tab View.

<img src="https://cdn.dribbble.com/users/1233499/screenshots/4844696/preview.gif" > 

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  animated_notch_bottom_bar: ^0.0.1
```
## Basic Usage

Place `AnimatedNotchBottomBar` in the bottomNavigationBar parameter of a `Scaffold` widget and provide `PageController` to `AnimatedNotchBottomBar`.

```dart
bottomNavigationBar:  AnimatedNotchBottomBar(
 pageController: _pageController,
  ...
)
```

##### Use any `Widget` as bottom bar item

You can also set any animated widget.
```dart
bottomNavigationBar:  AnimatedNotchBottomBar(
  pageController: _pageController,
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

     ///svg item
    BottomBarItems(
        inActiveItem: SvgPicture.asset(
          'assets/search_icon.svg',
           color: Colors.blueGrey,
       ),
       activeItem: SvgPicture.asset(
          'assets/search_icon.svg',
           color: Colors.black,
       ),
       itemLabel: 'Page 3',
    ),
     ...
)
```
##### Customized Blur Effect (iOS Tab View)

```dart
bottomNavigationBar:  AnimatedNotchBottomBar(
    ...
    showBlurBottomBar: true,
    blurOpacity: 0.2,
    blurFilterX: 5.0,
    blurFilterY: 10.0,
    ...
)
```
##### Show/hide item label and style

```dart
bottomNavigationBar:  AnimatedNotchBottomBar(
     ...
     showLabel: true,
     itemLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0
                    ),
     ...
)
```

### AnimatedNotchBottomBar
- `pageController` - the page controller which allows you to control the page animation duration and curve.
- `bottomBarItems` - navigation items, required more than one item and less than six.
- `onTap` - required to listen when an item is tapped it provides the selected item's index.
- `color` - the bottom bar's background color.
- `showLabel`: To show or hide the label under bottom bar item.
- `itemLabelStyle` - the bottom bar's item text style.
- `showShadow` - if false the bottom bar's elevation will be removed.
- `showBlurBottomBar` - if true the bottom bar will look blur.
- `blurOpacity` - to set opacity of blur effect.
- `blurFilterX` - Creates an image filter that applies a Gaussian blur at x axis.
- `blurFilterY` - Creates an image filter that applies a Gaussian blur at y axis.

### BottomBarItems
- `title` - the bottom bar item label
- `activeItem` - the selected item.
- `inActiveItem` - the inactive item.

## Guideline for contributors
Contribution towards our repository is always welcome, we request contributors to create a pull request to the develop branch only.

# LICENSE!
Animated Notch Bottom Bar is [MIT-licensed](https://github.com/Mindinventory/animated_notch_bottom_bar/blob/main/LICENSE "MIT-licensed").

# Let us know!
We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com and do let us know if you have any questions or suggestion regarding our work.

