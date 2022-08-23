import 'package:flutter/material.dart';

import 'constants/constants.dart';

class BottomBarActiveItem extends StatelessWidget {
  const BottomBarActiveItem(
    this.index, {
    this.iconData,
    this.scrollPosition,
    this.onTap,
  });

  final int index;

  final Widget? iconData;

  /// Double value to indicate the item position
  final double? scrollPosition;

  /// Function called when an item was tapped
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final icon = iconData!;
    return InkWell(
      child: SizedBox.fromSize(
        size: const Size(kIconSize, kIconSize),
        child: Opacity(
            opacity: kPi * 2 * (scrollPosition! % 1) == 0 ? 1 : 0, child: icon),
      ),
      onTap: () => onTap!(index),
    );
  }
}
