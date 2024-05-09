import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum LogSui {
  Black("30"),
  Red("31"),
  Green("32"),
  Yellow("33"),
  Blue("34"),
  Magenta("35"),
  Cyan("36"),
  White("37");

  final String code;
  const LogSui(this.code);

  void msg(dynamic text, data) {
    try {
      var textData = data == null
          ? jsonEncode(data)
          : const JsonEncoder.withIndent('  ').convert(data);

      if (kDebugMode) {
        developer.log('|-');
        developer.log('|--');
        developer.log('|---');
        developer.log('**===== $text =====**');
        developer.log('\x1B[' + code + 'm' + textData.toString() + '\x1B[0m');
        developer.log('**----- $text -----**');
        developer.log('|---');
        developer.log('|--');
        developer.log('|-');
      }
    } catch (e) {
      print(e);
    }
  }

  void log(data) {
    try {
      var textData = data == null
          ? jsonEncode(data)
          : const JsonEncoder.withIndent('  ').convert(data);

      if (kDebugMode) {
        developer.log('\x1B[' + code + 'm' + textData.toString() + '\x1B[0m');
      }
    } catch (e) {
      print(e);
    }
  }
}

Response ResponseSui(
  String method,
  Response<dynamic> response, {
  Map<String, dynamic>? params,
  Map<dynamic, dynamic>? data,
}) {
  if (kDebugMode) {
    final logColors = {
      'create': LogSui.Green,
      'getAll': LogSui.White,
      'getOne': LogSui.Yellow,
      'update': LogSui.Cyan,
      'delete': LogSui.Red,
    };

    developer.log('**===== API-URL $method =====**');
    for (var i = 0; i < 2; i++) developer.log('$i--');

    developer.log('----------- RESPONSE -----------');
    LogSui.Magenta.log({
      'statusCode': response.statusCode,
      'statusMessage': response.statusMessage,
      'method': response.requestOptions.method,
      'path': response.requestOptions.path,
    });
    for (var i = 0; i < 2; i++) developer.log('$i--');

    if (data != null) {
      developer.log('----------- DATA -----------');
      LogSui.Cyan.log(data);
      for (var i = 0; i < 2; i++) developer.log('$i--');
    }

    if (params != null) {
      developer.log('----------- PARAMS -----------');
      LogSui.Cyan.log(params);
      for (var i = 0; i < 2; i++) developer.log('$i--');
    }

    if (logColors.containsKey(method)) {
      logColors[method]!.log(response.data);
    }

    developer.log('**===== END API-URL $method =====**');
  }

  return response;
}
