// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const int MAX_MOBILE_WIDTH = 800;
const int MAX_TABLET_WIDTH = 1200;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < MAX_MOBILE_WIDTH;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= MAX_MOBILE_WIDTH && MediaQuery.of(context).size.width < MAX_TABLET_WIDTH;

  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= MAX_TABLET_WIDTH;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? desktop;
    } else {
      return mobile;
    }
  }
}
