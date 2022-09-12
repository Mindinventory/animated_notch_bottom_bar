import 'package:flutter/material.dart';

class BottomBarItems {
  const BottomBarItems({
    this.inActiveItem,
    this.activeItem,
    this.itemLabel,
  });

  /// Selected bottom bar item
  final Widget? inActiveItem;

  /// Un selected bottom bar item
  final Widget? activeItem;

  /// bottom bar item label
  final String? itemLabel;
}
