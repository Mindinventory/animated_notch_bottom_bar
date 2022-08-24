library rolling_bottom_bar;

import 'package:flutter/material.dart';

import 'constants/constants.dart';

/// Class to generate the inactive icon on bottom bar
class BottomBarUnActiveItem extends StatelessWidget {
  const BottomBarUnActiveItem(this.index,
      {this.itemWidget,
      this.label,
      this.labelColor,
      this.onTap,
      this.showLabel});

  /// item index
  final int index;

  /// item widget
  final Widget? itemWidget;

  /// String to indicate the label item
  final String? label;

  /// Boolean to show the item label
  final bool? showLabel;

  /// Value to indicate the icon color
  final Color? labelColor;

  /// Function called when an item was tapped
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(kCircleRadius * 2, kCircleRadius * 2),
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: kIconSize, width: kIconSize, child: itemWidget!),
            if (label != null && showLabel!) ...[
              const SizedBox(height: 5.0),
              Text(
                label!,
                style: TextStyle(
                  color: labelColor ?? Colors.grey[700],
                  fontSize: 12.0,
                ),
              ),
            ],
          ],
        ),
        onTap: () => onTap!(index),
      ),
    );
  }
}
