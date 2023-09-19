import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../utils/utils.dart';

dioError(DioError e) {
  String message;
  try {
    switch (e.type) {
      case DioErrorType.cancel:
        message = "Se canceló la solicitud al servidor";
        // message = "Request to server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Tiempo de espera de conexión con el servidor";
        // message = "Connection timeout with server";
        break;
      case DioErrorType.other:
        message =
            "Falló la conexión con el servidor debido a la conexión a Internet";
        // message = "Connection to server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Tiempo de espera de recepción en conexión con el servidor";
        // message = "Receive timeout in connection with server";
        break;
      case DioErrorType.response:
        message = _handleError(e.response!.statusCode!, e.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Tiempo de espera de envío en conexión con el servidor";
        // message = "Send timeout in connection with server";
        break;
      default:
        message = "Algo salió mal, comuníquese con un administrador";
        // message = "Something went wrong";
        break;
    }

    toastSui(
      message,
      seconds: 7,
      color: const Color.fromRGBO(198, 40, 40, 1),
    );

    if (kDebugMode) {
      LogSui.Red.msg('DioError', e);
    }
  } catch (e) {
    if (kDebugMode) {
      LogSui.Red.msg('DioError try catch', e);
    }
  }
}

String _handleError(int statusCode, dynamic error) {
  bool vacio = error["message"].isNotEmpty;
  switch (statusCode) {
    case 400:
      if (error["message"].runtimeType == List) {
        String message = '';
        error["message"]
            .map((el) =>
                message = message.isEmpty ? '- ' + el : message + '\n- ' + el)
            .toList();
        return message;
      }

      return vacio ? error["message"] : 'Solicitud incorrecta';
    case 401:
      return vacio ? error["message"] : 'Error de usuario';
    case 403:
      return vacio ? error["message"] : 'Error de acceso al recurso';
    // return 'Bad request';
    case 404:
      // return error["message"];
      return vacio ? error["message"] : 'Ha ocurrido un error - (404)';
    case 500:
      return vacio ? error["message"] : 'Error interno del servidor';
    // return 'Internal server error';
    default:
      return vacio
          ? error["data"]
          : 'Vaya, algo salió mal, póngase en contacto con el administrador';
    // return 'Oops something went wrong';
  }
}
