import 'package:flutter/material.dart';

import '../utils/size_util.dart';

class ResponsiveSui extends StatelessWidget {
  const ResponsiveSui({
    Key? key,
    required this.desktop,
    this.tablet,
    required this.mobile,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) => wpSui(context) < 850;

  static bool isTablet(BuildContext context) =>
      wpSui(context) < 1100 && wpSui(context) >= 850;

  static bool isDesktop(BuildContext context) => wpSui(context) >= 1100;

  @override
  Widget build(BuildContext context) {
    bool desktopSize = wpSui(context) >= 1100;
    bool tabletSize = wpSui(context) < 1100 && wpSui(context) >= 650;
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: desktopSize
              ? desktop
              : tabletSize && tablet != null
                  ? tablet
                  : mobile,
        );
      },
    );
  }
}
