import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/text_widget.dart';

toastSui(
  String texto, {
  int seconds = 2,
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

loadingSui({Widget? loading}) {
  Color backgroundColor = Colors.black54;
  int seconds = 2;
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
      seconds: seconds,
    ),
    backgroundColor: backgroundColor,
    align: Alignment.center,
    toastBuilder: (cancelFunc) {
      return Container(
        width: 100,
        height: 100,
        color: Colors.white,
        child: loading ??
            const SpinKitFadingFour(
              color: Colors.black,
              size: 50.0,
            ),
      );
    },
  );
}

notificationSui({Widget? child}) {
  bool enableSlideOff = true;
  bool onlyOne = true;
  bool crossPage = true;
  int seconds = 10;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  return BotToast.showCustomNotification(
    animationDuration: Duration(milliseconds: animationMilliseconds),
    animationReverseDuration:
        Duration(milliseconds: animationReverseMilliseconds),
    duration: Duration(seconds: seconds),
    backButtonBehavior: backButtonBehavior,
    toastBuilder: (cancel) {
      return child ??
          _NotificationWidget(
            cancelFunc: cancel,
          );
    },
    enableSlideOff: enableSlideOff,
    onlyOne: onlyOne,
    crossPage: crossPage,
  );
}

class _NotificationWidget extends StatefulWidget {
  final CancelFunc? cancelFunc;

  const _NotificationWidget({this.cancelFunc});

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget> {
  bool loveMe = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                // IconButton(
                //   icon: const Icon(Icons.favorite),
                //   color: loveMe ? Colors.redAccent : Colors.grey,
                //   onPressed: () {
                //     setState(() {
                //       loveMe = !loveMe;
                //       BotToast.showText(
                //           onlyOne: true,
                //           text: loveMe ? "Yes, I love you.😘" : "No!!!!😫");
                //     });
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      TextSui(
                        'Mensaje',
                        bold: true,
                      ),
                      TextSui(
                        'Sub mensaje',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            color: loveMe ? Colors.redAccent : Colors.grey,
            onPressed: widget.cancelFunc,
          )
        ],
      ),
    );
  }
}
