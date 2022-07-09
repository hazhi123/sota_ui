import 'dart:async';
import 'dart:developer' as develop;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

logSui(String text, data) {
  if (kDebugMode) {
    develop.log('**$text INICIO**');
    develop.log(data.toString());
    develop.log('**$text FIN**');
  }
}

modalSui(
  BuildContext context, {
  required Widget child,
  bool animated = false,
  bool barrierDismissible = true,
  bool transparent = false,
  double elevation = 10.0,
  Color backgroundColor = Colors.white,
  Color? barrierColor,
}) {
  Widget dialog = Dialog(
    elevation: elevation,
    insetPadding: const EdgeInsets.all(0),
    alignment: Alignment.center,
    backgroundColor: transparent ? Colors.transparent : backgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
      ],
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor ?? Colors.black54,
    builder: (BuildContext context) {
      return animated
          ? FadeInUp(duration: const Duration(milliseconds: 500), child: dialog)
          : dialog;
    },
  );
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

timerSui(time, funcion) {
  Duration d = Duration(milliseconds: time);
  if (time.toString().length < 3) {
    d = Duration(seconds: time);
  }
  Timer(d, funcion);
}
