import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

modalSui(
  BuildContext context, {
  required Widget child,
  bool animated = false,
  bool barrierDismissible = true,
  bool transparent = false,
  double elevation = 10.0,
  Color backgroundColor = Colors.white,
  Color? barrierColor,
  Alignment? alignment,
}) {
  Widget dialog = Dialog(
    elevation: elevation,
    insetPadding: const EdgeInsets.all(0),
    alignment: alignment ?? Alignment.center,
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

timerSui(time, funcion) {
  Timer(
      time.toString().length > 2
          ? Duration(milliseconds: time)
          : Duration(seconds: time),
      funcion);
}

encryptSui(type, data) {
  final key = encrypt.Key.fromUtf8('1f8ec6a83ab730706c48647e94a75114');
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  dynamic enc;
  if (type == 'en') {
    var value = encrypter.encrypt(data, iv: iv);
    enc = value.base64;
  }
  if (type == 'de') {
    enc = encrypter.decrypt(encrypt.Encrypted.from64(data), iv: iv);
  }
  return enc;
}

dateformat(
  isFormat,
  data, {
  bool inverse = false,
  String? format,
  bool fecha = false,
  natural = false,
}) {
  String formatString = "yyyy-MM-dd";

  if (format != null) {
    formatString = format;
  } else if (natural) {
    formatString = "dd MMMM, yyyy";
  } else if (fecha) {
    formatString = "dd/MM/yyyy";
  } else if (inverse) {
    formatString = "dd-MM-yyyy";
  }

  DateFormat dateFormat = DateFormat(formatString, "es");
  if (isFormat) {
    return dateFormat.format(data ?? DateTime.now());
  } else {
    return data == null ? DateTime.now() : dateFormat.parse(data);
  }
}

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  Debouncer({this.milliseconds, this.timer, this.action});

  run(VoidCallback action) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}

DateTime geterDateUtil({DateTime? date}) {
  if (date == null) date = DateTime.now();

  return DateTime(date.year, date.month, date.day, 12, 00, 00);
}

DateTime geterTimeUtil({DateTime? fechaDefault, DateTime? date}) {
  if (date == null) date = DateTime.now();

  if (fechaDefault == null) fechaDefault = DateTime.now();

  return DateTime(
    fechaDefault.year,
    fechaDefault.month,
    fechaDefault.day,
    date.hour,
    date.minute,
  );
}

DateTime geterDateTimeUtil({DateTime? date}) {
  if (date == null) date = DateTime.now();

  return DateTime(
    date.year,
    date.month,
    date.day,
    date.hour,
    date.minute,
  );
}
