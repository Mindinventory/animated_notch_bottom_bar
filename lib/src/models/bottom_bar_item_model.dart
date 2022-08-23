import 'package:flutter/material.dart';

class SvgBottomBarItem {
  const SvgBottomBarItem({this.inActiveWidget, this.activeWidget, this.label});

  final Widget? inActiveWidget;

  final Widget? activeWidget;

  final String? label;
}
