import 'package:flutter/material.dart';
import 'image_widget.dart';
import 'text_widget.dart';

const String materialConst = 'material';
const String outlinedConst = 'outlined';
const String iconConst = 'icon';

class ButtonSui extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color, tColor, highlightColor, backgroundColor;
  final Widget? child;
  final bool tWhite, tBold;
  final String? text;
  final String? type, svg, img;
  final IconData? icon;
  final EdgeInsets? padding;
  final double? iconSize, width, height, size, rounded, sizeSvg, lSpacing;
  final double elevation, tSize;

  const ButtonSui({
    Key? key,
    this.onPressed,
    this.color,
    this.child,
    this.tWhite = false,
    this.text,
    this.tBold = false,
    this.tColor,
    this.tSize = 14.0,
    this.type,
    this.icon,
    this.svg,
    this.iconSize,
    this.highlightColor,
    this.width,
    this.height,
    this.lSpacing,
    this.size,
    this.img,
    this.padding,
    this.rounded,
    this.backgroundColor,
    this.sizeSvg,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case materialConst:
        return buttonMaterial();
      case outlinedConst:
        return icon == null ? buttonOutlined() : buttonOutlinedIcon();
      case iconConst:
        return buttonIcon();
      default:
        return buttonMaterial();
    }
  }

  buttonIcon() => Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: IconButton(
          onPressed: onPressed,
          icon: iconWidget(),
          color: color,
          highlightColor: highlightColor,
          padding: const EdgeInsets.all(0),
          iconSize: size,
        ),
      );

  buttonMaterial() {
    double pd = 0.0;
    if (elevation != 0.0) {
      pd = 8.0;
    }

    return Container(
      width: width ?? size,
      height: height ?? size,
      padding: EdgeInsets.all(pd),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(rounded == null ? 5.0 : rounded!)),
        child: body(),
        elevation: elevation,
        padding: padding ?? const EdgeInsets.all(0),
      ),
    );
  }

  buttonOutlined() => Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
              width: 2.0,
              color: color ?? Colors.black,
            ),
          ),
          child: body(),
        ),
      );

  buttonOutlinedIcon() => Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
              width: 2.0,
              color: color ?? Colors.black,
            ),
          ),
          onPressed: () {},
          icon: iconWidget(),
          label: textWidget(),
        ),
      );

  body() {
    return child ??
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (text != null) textWidget(),
            if (icon != null) iconWidget()
          ],
        );
  }

  textWidget() => TextSui(
        text!,
        color: type == outlinedConst && tColor == null ? color : tColor,
        white: tWhite,
        size: tSize,
        bold: tBold,
        lSpacing: lSpacing,
      );

  iconWidget() => icon != null
      ? Icon(
          icon,
          color: tWhite ? Colors.white : tColor,
          size: iconSize,
        )
      : svg != null
          ? ImageSui(
              svg: svg!,
              size: 30.0,
              color: tWhite ? Colors.white : tColor ?? Colors.black,
            )
          : ImageSui(img: img!);
}
