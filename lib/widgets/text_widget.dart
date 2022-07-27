import 'package:flutter/material.dart';

class TextSui extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final bool bold,
      light,
      black,
      regular,
      left,
      center,
      right,
      white,
      softWrap,
      overflow;
  final TextAlign? align;
  final int? maxLines;
  final TextStyle? style;
  final EdgeInsets? padding;
  final double? lSpacing;
  final double? height;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const TextSui(
    this.text, {
    Key? key,
    this.color,
    this.size = 14.0,
    this.bold = false,
    this.light = false,
    this.regular = false,
    this.black = false,
    this.overflow = false,
    this.align,
    this.left = false,
    this.center = false,
    this.right = false,
    this.softWrap = true,
    this.white = false,
    this.maxLines,
    this.style,
    this.padding,
    this.lSpacing,
    this.height,
    this.fontFamily,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Text(
        text,
        overflow: overflow ? TextOverflow.ellipsis : null,
        softWrap: softWrap,
        maxLines: maxLines,
        textAlign: left
            ? TextAlign.start
            : center
                ? TextAlign.center
                : right
                    ? TextAlign.end
                    : align,
        style: style ??
            TextStyle(
              letterSpacing: lSpacing,
              color: white ? Colors.white : color,
              height: height,
              fontSize: size,
              fontFamily: fontFamily,
              fontWeight: fontWeight ??
                  (bold
                      ? FontWeight.w700
                      : light
                          ? FontWeight.w100
                          : FontWeight.w500),
            ),
      ),
    );
  }
}
