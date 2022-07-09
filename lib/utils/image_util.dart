import 'package:flutter/material.dart';
import '../sotaui.dart';

const String imgFolder = 'assets/images';
const String lotFolder = 'assets/lottie';
const String pngFolder = '$imgFolder/png';
const String svgFolder = '$imgFolder/svg';

const String imageConst = 'image';
const String svgConst = 'svg';
const String dashImg = '$pngFolder/dash.png';

const String menuLot = '$lotFolder/menu.json';
const String loadingLot = '$lotFolder/loading.json';
const String floatMenuLot = '$lotFolder/floatmenu.json';

imageSui(
  String text, {
  bool isSvg = false,
  double size = 100.0,
  double? width,
  double? height,
  bool isCover = false,
  BoxFit fit = BoxFit.contain,
  String hero = '',
  Color color = Colors.black,
}) {
  Widget img = Image(
    width: width ?? size,
    height: height ?? size,
    image: AssetImage(text),
    fit: isCover ? BoxFit.cover : fit,
  );

  Widget svg = SvgPicture.asset(
    text,
    color: color,
    width: width ?? size,
    height: height ?? size,
    fit: isCover ? BoxFit.cover : fit,
  );

  Widget heroWidget = Hero(
    tag: hero,
    child: isSvg ? svg : img,
  );

  return hero.isEmpty
      ? isSvg
          ? svg
          : img
      : heroWidget;
}

imageUrlSui(
  String url, {
  double? size,
  double loadingSize = 35.0,
  Color loadingColor = Colors.black,
  Widget? errorWidget,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  bool isWhite = false,
  bool isCover = false,
  String hero = '',
}) {
  Widget img = url.isEmpty
      ? const SizedBox()
      : CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          width: width ?? size,
          height: height ?? size,
          placeholder: (context, url) => SpinKitFadingFour(
            color: loadingColor,
            size: loadingSize,
          ),
          errorWidget: (context, url, error) =>
              errorWidget ??
              const Icon(
                Icons.image,
                size: 30,
                color: Colors.black,
              ),
        );

  Widget heroWidget = Hero(
    tag: hero,
    child: img,
  );

  return url.isNotEmpty
      ? hero.isEmpty
          ? img
          : heroWidget
      : Image(
          width: size ?? width,
          height: size ?? height,
          image: const AssetImage(dashImg),
          fit: isCover ? BoxFit.cover : fit,
        );
}

lottieSui(
  String text, {
  double size = 60.0,
  double? width,
  double? height,
  bool isCover = false,
  BoxFit fit = BoxFit.contain,
  String hero = '',
  Color color = Colors.black,
}) {
  return Lottie.asset(
    loadingLot,
    width: width ?? size,
    height: height ?? size,
    fit: isCover ? BoxFit.cover : fit,
  );
}
