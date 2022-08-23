import 'package:flutter/material.dart';

class BottomBarItemModel {
  const BottomBarItemModel(
      {this.inActiveWidget, this.activeWidget, this.label});

  final Widget? inActiveWidget;

  final Widget? activeWidget;

  final String? label;
}
