import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

toastSui(
  String texto, {
  int seconds = 4,
  Color color = Colors.black87,
}) {
  bool clickClose = false;
  bool onlyOne = true;
  bool crossPage = true;

  double align = 0.7;
  int fontSize = 16;
  int borderRadius = 10;
  Color fontColor = Colors.white;
  Color backgroundColor = Colors.transparent;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  return BotToast.showText(
    text: texto,
    duration: Duration(seconds: seconds),
    onlyOne: onlyOne,
    clickClose: clickClose,
    crossPage: crossPage,
    backButtonBehavior: backButtonBehavior,
    align: Alignment(0, align),
    animationDuration: Duration(milliseconds: animationMilliseconds),
    animationReverseDuration:
        Duration(milliseconds: animationReverseMilliseconds),
    textStyle: TextStyle(color: fontColor, fontSize: fontSize.toDouble()),
    borderRadius: BorderRadius.circular(borderRadius.toDouble()),
    backgroundColor: backgroundColor,
    contentColor: color,
  );
}

loadingSui({
  Widget? loading,
  double? size,
  double? width,
  double? height,
  double? lSize,
  int? seconds,
}) {
  Color backgroundColor = Colors.black54;
  bool clickClose = false;
  bool allowClick = true;
  bool ignoreContentClick = false;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  return BotToast.showCustomLoading(
    clickClose: clickClose,
    allowClick: allowClick,
    backButtonBehavior: backButtonBehavior,
    ignoreContentClick: ignoreContentClick,
    animationDuration: Duration(milliseconds: animationMilliseconds),
    animationReverseDuration:
        Duration(milliseconds: animationReverseMilliseconds),
    duration: Duration(
      seconds: seconds ?? 2,
    ),
    backgroundColor: backgroundColor,
    align: Alignment.center,
    toastBuilder: (cancelFunc) {
      return Container(
        width: size ?? (width ?? 100),
        height: size ?? (height ?? 100),
        color: Colors.white,
        child: loading ??
            SpinKitFadingFour(
              color: Colors.black,
              size: lSize ?? 50.0,
            ),
      );
    },
  );
}

notificationSui({
  required Widget child,
  double? width,
  double? height,
  Color? color,
  Color? closeColor,
  int time = 10,
}) {
  bool enableSlideOff = true;
  bool onlyOne = true;
  bool crossPage = true;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  return BotToast.showCustomNotification(
    animationDuration: Duration(milliseconds: animationMilliseconds),
    animationReverseDuration:
        Duration(milliseconds: animationReverseMilliseconds),
    duration: time.toString().length > 2
        ? Duration(milliseconds: time)
        : Duration(seconds: time),
    backButtonBehavior: backButtonBehavior,
    toastBuilder: (cancel) {
      return Container(
        width: width ?? 300,
        height: height ?? 70,
        color: color ?? Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(child: child),
            const SizedBox(width: 10),
            ButtonSui(
              size: 30,
              rounded: 15,
              onPressed: cancel,
              icon: Icons.close,
              tColor: closeColor ?? Colors.black,
            )
          ],
        ),
      );
    },
    enableSlideOff: enableSlideOff,
    onlyOne: onlyOne,
    crossPage: crossPage,
  );
}
