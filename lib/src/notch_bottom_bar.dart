import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottom_bar_active_item.dart';
import 'bottom_bar_inactive_item.dart';
import 'bottom_bar_painter.dart';
import 'constants/constants.dart';
import 'models/bottom_bar_item_model.dart';
import 'notch_bottom_bar_controller.dart';

/// Class to generate the NotchBottomBar
class AnimatedNotchBottomBar extends StatefulWidget {
  /// Controller for animation
  final NotchBottomBarController notchBottomBarController;

  /// List of items of bottom bar
  final List<BottomBarItem> bottomBarItems;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  /// Color of bottom bar
  final Color color;

  /// Boolean to show shadow
  final bool showShadow;

  /// Boolean to show bottom text
  final bool showLabel;

  /// TextStyle to show bottom text
  final TextStyle? itemLabelStyle;

  ///Boolean to show blur effect
  final bool showBlurBottomBar;

  ///Opacity
  final double blurOpacity;

  /// Filter X
  final double blurFilterX;

  /// Filter Y
  final double blurFilterY;

  /// Color of bottom bar
  final Color notchColor;

  /// Duration in milliseconds for animation
  final int durationInMilliSeconds;

  /// bottom bar width for web and desktop apps (It should be greater then 500 otherwise it will take media query width)
  final double bottomBarWidth;

  /// Hide side and bottom margins of bottom navigation bar
  final bool removeMargins;

  const AnimatedNotchBottomBar({
    Key? key,
    required this.notchBottomBarController,
    required this.bottomBarItems,
    required this.onTap,
    this.color = Colors.white,
    this.itemLabelStyle,
    this.showShadow = true,
    this.showLabel = true,
    this.showBlurBottomBar = false,
    this.blurOpacity = 0.5,
    this.blurFilterX = 5.0,
    this.blurFilterY = 10.0,
    this.notchColor = Colors.white,
    this.durationInMilliSeconds = 300,
    this.bottomBarWidth = 500,
    this.removeMargins = false,
  }) : super(key: key);

  @override
  _AnimatedNotchBottomBarState createState() => _AnimatedNotchBottomBarState();
}

class _AnimatedNotchBottomBarState extends State<AnimatedNotchBottomBar> with SingleTickerProviderStateMixin {
  late double _screenWidth;
  int maxCount = 5;
  int currentIndex = 0;
  late final AnimationController _animationController;
  bool _isInitial = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width <= 500 ? MediaQuery.of(context).size.width : widget.bottomBarWidth;
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.durationInMilliSeconds));
    kHeight = widget.removeMargins ? 72.0 : 62.0;
    kMargin = widget.removeMargins ? 0 : 14.0;
    widget.notchBottomBarController.addListener(() {
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// throws exception if list length is more then 5
    if (widget.bottomBarItems.length > 5) {
      throw Exception(' Bottom bar item length should not be more than 5');
    }

    /// uncomment
    if (widget.notchBottomBarController.index > widget.bottomBarItems.length - 1) {
      throw Exception(' Initial page index cannot be higher than bottom bar items length');
    }
    final double height = kHeight + kMargin * 2;

    return widget.bottomBarItems.length > maxCount
        ? Container()
        : Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext _, Widget? __) {
                ///to set any initial page
                double scrollPosition = widget.notchBottomBarController.index.toDouble();
                int? currentIndex = widget.notchBottomBarController.index;
                if (widget.notchBottomBarController.oldIndex != null) {
                  _isInitial = false;
                  scrollPosition = Tween<double>(
                          begin: widget.notchBottomBarController.oldIndex!.toDouble(),
                          end: widget.notchBottomBarController.index.toDouble())
                      // ignore: invalid_use_of_protected_member
                      .lerp(_animationController.value);
                  currentIndex = widget.notchBottomBarController.index;
                } else {
                  scrollPosition = widget.notchBottomBarController.index.toDouble();
                  currentIndex = widget.notchBottomBarController.index;
                }

                return ClipRRect(
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.removeMargins ? 22.0 : 8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: widget.showBlurBottomBar ? widget.blurFilterX : 0.0,
                            sigmaY: widget.showBlurBottomBar ? widget.blurFilterY : 0.0,
                          ),
                          child: Opacity(
                            opacity: widget.showBlurBottomBar ? widget.blurOpacity : 1,
                            child: CustomPaint(
                              size: Size(_screenWidth, height),
                              painter: BottomBarPainter(
                                  position: _itemPosByScrollPosition(scrollPosition),
                                  color: widget.color,
                                  showShadow: widget.showShadow,
                                  notchColor: widget.notchColor),
                            ),
                          ),
                        ),
                        for (var i = 0; i < widget.bottomBarItems.length; i++) ...[
                          if (i == currentIndex && (_animationController.value == 1.0 || _isInitial))
                            Positioned(
                              top: widget.removeMargins ? -kCircleMargin / 2 : kTopMargin,
                              left: kCircleRadius - kCircleMargin / 2 + _itemPosByScrollPosition(scrollPosition),
                              child: BottomBarActiveItem(
                                i,
                                itemWidget: widget.bottomBarItems[i].activeItem,
                                scrollPosition: scrollPosition,
                                onTap: widget.onTap,
                              ),
                            ),
                          if (i != currentIndex)
                            Positioned(
                              top: kMargin + (kHeight - kCircleRadius * 2) / 2,
                              left: kCircleMargin + _itemPosByIndex(i),
                              child: BottomBarInActiveItem(i,
                                  itemWidget: widget.bottomBarItems[i].inActiveItem,
                                  label: widget.bottomBarItems[i].itemLabel, onTap: (selectedIndex) {
                                widget.notchBottomBarController.jumpTo(selectedIndex);
                                widget.onTap.call(selectedIndex);
                              }, showLabel: widget.showLabel, labelStyle: widget.itemLabelStyle),
                            ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }

  double _firstItemPosition(double spaceParameter) {
    return (_screenWidth - kMargin * 2) * spaceParameter;
  }

  double _lastItemPosition(double spaceParameter) {
    return _screenWidth - (_screenWidth - kMargin * 2) * spaceParameter - (kCircleRadius + kCircleMargin) * 2;
  }

  double _itemDistance() {
    return (_lastItemPosition(widget.removeMargins ? 0.05 : 0.1) -
            _firstItemPosition(widget.removeMargins ? 0.05 : 0.1)) /
        (widget.bottomBarItems.length - 1);
  }

  double _itemPosByScrollPosition(double scrollPosition) {
    return _firstItemPosition(widget.removeMargins ? 0.05 : 0.1) + _itemDistance() * scrollPosition;
  }

  double _itemPosByIndex(int index) {
    return _firstItemPosition(widget.removeMargins ? 0.05 : 0.1) + _itemDistance() * index;
  }
}
