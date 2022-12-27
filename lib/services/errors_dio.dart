import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../utils/utils.dart';

dioError(DioError e) {
  String message;
  try {
    switch (e.type) {
      case DioErrorType.cancel:
        message = "Se canceló la solicitud al servidor API";
        // message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Tiempo de espera de conexión con el servidor API";
        // message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message =
            "Falló la conexión con el servidor API debido a la conexión a Internet";
        // message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message =
            "Tiempo de espera de recepción en conexión con el servidor API";
        // message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(e.response!.statusCode!, e.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Tiempo de espera de envío en conexión con el servidor API";
        // message = "Send timeout in connection with API server";
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
  bool vacio = error["data"].isNotEmpty;
  switch (statusCode) {
    case 400:
      return vacio ? error["data"] : 'Solicitud incorrecta';
    // return 'Bad request';
    case 404:
      // return error["message"];
      return vacio ? error["data"] : 'Ha ocurrido un error - (404)';
    case 500:
      return vacio ? error["data"] : 'Error interno del servidor';
    // return 'Internal server error';
    default:
      return vacio
          ? error["data"]
          : 'Vaya, algo salió mal, póngase en contacto con el administrador';
    // return 'Oops something went wrong';
  }
}
