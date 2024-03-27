import 'package:flutter/material.dart';

class BottomBarItem {
  const BottomBarItem({
    required this.inActiveItem,
    required this.activeItem,
    this.itemLabel,
    this.itemLabelWidget,
  }) : assert(itemLabel == null || itemLabelWidget == null);

  /// Selected bottom bar item
  final Widget inActiveItem;

  /// Un selected bottom bar item
  final Widget activeItem;

  /// bottom bar item label
  final String? itemLabel;

  /// bottom bar item label widget
  final Widget? itemLabelWidget;
}
