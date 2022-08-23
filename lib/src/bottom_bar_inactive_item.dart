library rolling_bottom_bar;

import 'package:flutter/material.dart';

import 'constants/constants.dart';

/// Class to generate the inactive icon on bottom bar
class BottomBarUnActiveItem extends StatelessWidget {
  const BottomBarUnActiveItem(this.index,
      {this.iconData, this.label, this.lableColor, this.onTap});

  /// Int value to indicate the index on app bar
  final int index;

  /// Value necessary to render the icon
  final Widget? iconData;

  /// String to indicate the label item
  final String? label;

  /// Value to indicate the icon color
  final Color? lableColor;

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
            SizedBox(height: kIconSize, width: kIconSize, child: iconData!),
            if (label != null) ...[
              const SizedBox(height: 5.0),
              Text(
                label!,
                style: TextStyle(
                  color: lableColor ?? Colors.grey[700],
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
