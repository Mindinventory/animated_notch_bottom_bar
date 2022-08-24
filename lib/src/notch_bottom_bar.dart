import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottom_bar_active_item.dart';
import 'bottom_bar_inactive_item.dart';
import 'bottom_bar_painter.dart';
import 'constants/constants.dart';
import 'models/bottom_bar_item_model.dart';

/// Class to generate the NotchBottomBar
class NotchBottomBar extends StatefulWidget {
  /// Controller for animation
  final PageController? pageController;

  /// List of items of bottom bar
  final List<BottomBarItems>? bottomBarItems;

  /// Function called when an item was tapped
  final ValueChanged<int>? onTap;

  /// Color of bottom bar
  final Color color;

  /// Color of inactive item
  final Color? labelColor;

  /// Boolean to show shadow
  final bool? showShadow;

  /// Boolean to show bottom text
  final bool? showLabel;

  ///Boolean to show blur effect
  final bool? showBlurBottomBar;

  ///Opacity
  final double? opacity;

  /// Filter X
  final double? filterX;

  /// Filter Y
  final double? filterY;

  const NotchBottomBar(
      {Key? key,
      required this.pageController,
      required this.bottomBarItems,
      required this.onTap,
      this.color = Colors.white,
      this.labelColor,
      this.showShadow = true,
      this.showLabel = true,
      this.showBlurBottomBar = false,
      this.opacity = 0.5,
      this.filterX = 5.0,
      this.filterY = 10.0})
      : super(key: key);

  @override
  _NotchBottomBarState createState() => _NotchBottomBarState();
}

class _NotchBottomBarState extends State<NotchBottomBar> {
  double? _screenWidth;
  int maxCount = 5;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    /// throws exception if list length is more then 5
    if (widget.bottomBarItems!.length > 5) {
      throw Exception(' Bottom bar item length shouldn\'t be more then 5');
    }
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const height = kHeight + kMargin * 2;

    return widget.bottomBarItems!.length > maxCount
        ? Container()
        : AnimatedBuilder(
            animation: widget.pageController!,
            builder: (BuildContext _, Widget? child) {
              double scrollPosition = 0.0;
              int currentIndex = 0;
              if (widget.pageController?.hasClients ?? false) {
                scrollPosition = widget.pageController!.page!;
                currentIndex = (widget.pageController!.page! + 0.5).toInt();
              }

              return ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX:
                              widget.showBlurBottomBar! ? widget.filterX! : 0.0,
                          sigmaY:
                              widget.showBlurBottomBar! ? widget.filterY! : 0.0,
                        ),
                        child: Opacity(
                          opacity:
                              widget.showBlurBottomBar! ? widget.opacity! : 1,
                          child: CustomPaint(
                            size: Size(width, height),
                            painter: BottomBarPainter(
                              position:
                                  _itemPosByScrollPosition(scrollPosition),
                              color: widget.color ,
                              showShadow: widget.showShadow,
                            ),
                          ),
                        ),
                      ),
                      for (var i = 0;
                          i < widget.bottomBarItems!.length;
                          i++) ...[
                        if (i == currentIndex)
                          Positioned(
                            top: kTopMargin,
                            left: kCircleRadius -
                                kCircleMargin / 2 +
                                _itemPosByScrollPosition(scrollPosition),
                            child: BottomBarActiveItem(
                              i,
                              itemWidget: widget.bottomBarItems![i].activeItem,
                              scrollPosition: scrollPosition,
                              onTap: widget.onTap,
                            ),
                          ),
                        if (i != currentIndex)
                          Positioned(
                            top: kMargin + (kHeight - kCircleRadius * 2) / 2,
                            left: kCircleMargin + _itemPosByIndex(i),
                            child: BottomBarUnActiveItem(i,
                                itemWidget:
                                    widget.bottomBarItems![i].inActiveItem!,
                                label: widget.bottomBarItems![i].itemLabel,
                                labelColor: widget.labelColor,
                                onTap: widget.onTap,
                                showLabel: widget.showLabel),
                          ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
  }

  double _firstItemPosition() {
    return (_screenWidth! - kMargin * 2) * 0.1;
  }

  double _lastItemPosition() {
    return _screenWidth! -
        (_screenWidth! - kMargin * 2) * 0.1 -
        (kCircleRadius + kCircleMargin) * 2;
  }

  double _itemDistance() {
    return (_lastItemPosition() - _firstItemPosition()) /
        (widget.bottomBarItems!.length - 1);
  }

  double _itemPosByScrollPosition(double scrollPosition) {
    return _firstItemPosition() + _itemDistance() * scrollPosition;
  }

  double _itemPosByIndex(int index) {
    return _firstItemPosition() + _itemDistance() * index;
  }
}
