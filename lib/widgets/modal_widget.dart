import 'package:flutter/material.dart';

import '../utils/size_util.dart';
import 'button_widget.dart';
import 'text_widget.dart';

class ModalSui extends StatelessWidget {
  final Widget child;
  final String titulo;
  final dynamic height, width;
  final dynamic hp, wp;
  final Color? color;
  final bool isClose, tWhite;

  const ModalSui({
    Key? key,
    required this.child,
    required this.titulo,
    this.height,
    this.width,
    this.hp,
    this.wp,
    this.tWhite = false,
    this.color,
    this.isClose = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = Container(
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: TextSui(
              titulo,
              size: 16,
              white: tWhite,
              bold: true,
            ),
          ),
          if (isClose)
            Positioned(
              top: 0,
              right: 0,
              child: ButtonSui(
                onPressed: () => Navigator.pop(context),
                size: 35,
                tWhite: tWhite,
                rounded: 10,
                icon: Icons.close,
                iconSize: 25,
              ),
            ),
        ],
      ),
    );

    return Container(
      width: width ?? wpSui(context, size: wp ?? 85),
      height: height ?? hpSui(context, size: hp ?? 65),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
