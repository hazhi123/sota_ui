import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

void logSui(String text, data, {String color = ''}) {
  if (kDebugMode) {
    developer.log('**$text INICIO**');
    switch (color) {
      case 'red':
        developer.log('\x1B[31m$data\x1B[31m');
        break;
      case 'green':
        developer.log('\x1B[32m$data\x1B[32m');
        break;
      case 'yellow':
        developer.log('\x1B[33m$data\x1B[33m');
        break;
      case 'cyan':
        developer.log('\x1B[36m$data\x1B[36m');
        break;
      case 'blue':
        developer.log('\x1B[36m$data\x1B[36m');
        break;
      default:
        developer.log('\x1B[37m$data\x1B[37m');
    }
    developer.log('**$text FIN**');
  }
}

// Reset:   \x1B[0m
// Black:   \x1B[30m
// White:   \x1B[37m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Cyan:    \x1B[36m