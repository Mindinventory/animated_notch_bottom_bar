import 'package:flutter/material.dart';

import 'bottom_bar_active_item.dart';
import 'bottom_bar_inactive_item.dart';
import 'bottom_bar_painter.dart';
import 'constants/constants.dart';
import 'models/bottom_bar_item_model.dart';

/// Class to generate the rolling bottom bar
class NotchBottomBar extends StatefulWidget {
  /// Controller for animation
  final PageController? controller;

  /// List of items of bottom bar
  final List<BottomBarItemModel>? items;

  /// Function called when an item was tapped
  final ValueChanged<int>? onTap;

  /// Color of bottom bar
  final Color color;

  /// Color of inactive item
  final Color? labelColor;

  const NotchBottomBar({
    Key? key,
    required this.controller,
    required this.items,
    required this.onTap,
    this.color = Colors.white,
    this.labelColor,
  }) : super(key: key);

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
    if (widget.items!.length > 5) {
      throw Exception(' Bottom bar length shouldn\'t be more then 5');
    }
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const height = kHeight + kMargin * 2;

    return widget.items!.length > maxCount
        ? Container()
        : AnimatedBuilder(
            animation: widget.controller!,
            builder: (BuildContext _, Widget? child) {
              double scrollPosition = 0.0;
              int currentIndex = 0;
              if (widget.controller?.hasClients ?? false) {
                scrollPosition = widget.controller!.page!;
                currentIndex = (widget.controller!.page! + 0.5).toInt();
              }

              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  CustomPaint(
                    size: Size(width, height),
                    painter: BottomBarPainter(
                      position: _itemPosByScrollPosition(scrollPosition),
                      color: widget.color,
                    ),
                  ),
                  for (var i = 0; i < widget.items!.length; i++) ...[
                    if (i == currentIndex)
                      Positioned(
                        top: kTopMargin,
                        left: kCircleRadius -
                            kCircleMargin / 2 +
                            _itemPosByScrollPosition(scrollPosition),
                        child: BottomBarActiveItem(
                          i,
                          iconData: widget.items![i].activeWidget,
                          scrollPosition: scrollPosition,
                          onTap: widget.onTap,
                        ),
                      ),
                    if (i != currentIndex)
                      Positioned(
                        top: kMargin + (kHeight - kCircleRadius * 2) / 2,
                        left: kCircleMargin + _itemPosByIndex(i),
                        child: BottomBarUnActiveItem(
                          i,
                          iconData: widget.items![i].inActiveWidget!,
                          label: widget.items![i].label,
                          labelColor: widget.labelColor,
                          onTap: widget.onTap,
                        ),
                      ),
                  ],
                ],
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
        (widget.items!.length - 1);
  }

  double _itemPosByScrollPosition(double scrollPosition) {
    return _firstItemPosition() + _itemDistance() * scrollPosition;
  }

  double _itemPosByIndex(int index) {
    return _firstItemPosition() + _itemDistance() * index;
  }
}
