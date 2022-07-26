import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../utils/image_util.dart';

class ImageSui extends StatelessWidget {
  final String? img, url, svg, lottie;
  final double size;
  final double? width;
  final double? height;
  final bool isCover;
  final BoxFit fit;
  final String hero;
  final Color color;
  final Widget? errorWidget;
  final EdgeInsets? padding;

  const ImageSui({
    Key? key,
    this.img,
    this.url,
    this.svg,
    this.lottie,
    this.size = 60.0,
    this.width,
    this.height,
    this.padding,
    this.isCover = false,
    this.fit = BoxFit.contain,
    this.hero = '',
    this.color = Colors.black,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imgWidget = Image(
      width: width ?? size,
      height: height ?? size,
      image: AssetImage(img ?? dashImg),
      fit: isCover ? BoxFit.cover : fit,
    );

    Widget svgWidget = SvgPicture.asset(
      img ?? '',
      color: color,
      width: width ?? size,
      height: height ?? size,
      fit: isCover ? BoxFit.cover : fit,
    );

    Widget urlWidget = CachedNetworkImage(
      imageUrl: url ?? '',
      fit: fit,
      width: width ?? size,
      height: height ?? size,
      placeholder: (context, url) => SpinKitFadingFour(
        color: color,
        size: 30,
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Icon(
            Icons.image,
            size: 30,
            color: Colors.black,
          ),
    );

    Widget lottieWidget = Lottie.asset(
      lottie ?? loadingLot,
      width: width ?? size,
      height: height ?? size,
      fit: isCover ? BoxFit.cover : fit,
    );

    Widget imgx = svg != null
        ? svgWidget
        : lottie != null
            ? lottieWidget
            : url != null
                ? urlWidget
                : imgWidget;

    Widget heroWidget = Hero(tag: hero, child: imgx);

    return Padding(
      padding: padding ?? const EdgeInsets.all(10.0),
      child: hero.isEmpty ? imgx : heroWidget,
    );
  }
}
