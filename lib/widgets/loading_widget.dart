import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animate_do/animate_do.dart' as animatedo;

class LoadingSui extends StatelessWidget {
  const LoadingSui({
    Key? key,
    this.animate = false,
    this.hide = false,
    this.color,
    this.size = 35.0,
    this.pb = 0.0,
    this.white = false,
  }) : super(key: key);

  final bool animate, hide, white;
  final Color? color;
  final double size, pb;

  @override
  Widget build(BuildContext context) {
    Widget spinkitWidget = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, pb),
      child: SpinKitThreeBounce(
        color: white ? Colors.white : color ?? Theme.of(context).primaryColor,
        size: size - 14,
      ),
    );

    Widget animatedWidget = animatedo.FadeIn(
      child: spinkitWidget,
    );

    return hide
        ? const SizedBox()
        : animate
            ? animatedWidget
            : spinkitWidget;
  }
}
