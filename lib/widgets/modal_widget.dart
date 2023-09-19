import 'package:flutter/material.dart';

import '../utils/size_util.dart';
import 'button_widget.dart';
import 'text_widget.dart';

class ModalSui extends StatelessWidget {
  final Widget child;
  final String titulo;
  final dynamic height, width, borderRadius;
  final dynamic hp, wp;
  final Color? color, backgroundColor;
  final bool isClose, tWhite;
  final EdgeInsets? padding;
  final VoidCallback? onClose, onBack;

  const ModalSui({
    Key? key,
    required this.child,
    required this.titulo,
    this.height,
    this.width,
    this.hp,
    this.wp,
    this.borderRadius = 10.0,
    this.tWhite = false,
    this.color,
    this.padding,
    this.onClose,
    this.onBack,
    this.backgroundColor,
    this.isClose = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = Container(
      height: 40,
      color: color ?? Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: Visibility(
              visible: onBack != null,
              child: ButtonSui(
                onPressed: onBack ?? () => Navigator.pop(context),
                size: 35,
                tWhite: tWhite,
                rounded: 10,
                icon: Icons.arrow_back,
                iconSize: 25,
              ),
            ),
          ),
          Expanded(
            child: TextSui(
              titulo,
              size: 16,
              white: tWhite,
              maxLines: 2,
              overflow: true,
              bold: true,
              center: true,
            ),
          ),
          ButtonSui(
            onPressed: onClose ?? () => Navigator.pop(context),
            size: 35,
            tWhite: tWhite,
            rounded: 10,
            icon: Icons.close,
            iconSize: 25,
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width ?? wpSui(context, size: wp ?? 90),
        height: height ?? hpSui(context, size: hp ?? 50),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            Expanded(
              child: Padding(
                padding: padding ?? const EdgeInsets.all(10.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
