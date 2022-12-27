// import 'dart:developer' as developer;

// import 'package:flutter/foundation.dart';

// enum LogSui {
//   Black("30"),
//   Red("31"),
//   Green("32"),
//   Yellow("33"),
//   Blue("34"),
//   Magenta("35"),
//   Cyan("36"),
//   White("37");

//   final String code;
//   const LogSui(this.code);

//   void msg(dynamic text, data) {
//     if (kDebugMode) {
//       developer.log('|-');
//       developer.log('|--');
//       developer.log('|---');
//       developer.log('**===== $text =====**');
//       developer.log('\x1B[' + code + 'm' + data.toString() + '\x1B[0m');
//       developer.log('**----- $text -----**');
//     }
//   }
// }

// // void logSui(String text, data, {String color = ''}) {
// //   if (kDebugMode) {
// //     developer.log('**$text INICIO**');
// //     switch (color) {
// //       case 'red':
// //         developer.log('\x1B[31m$data\x1B[31m');
// //         break;
// //       case 'green':
// //         developer.log('\x1B[32m$data\x1B[32m');
// //         break;
// //       case 'yellow':
// //         developer.log('\x1B[33m$data\x1B[33m');
// //         break;
// //       case 'blue':
// //         developer.log('\x1B[34m$data\x1B[34m');
// //         break;
// //       case 'magenta':
// //         developer.log('\x1B[35m$data\x1B[35m');
// //         break;
// //       case 'cyan':
// //         developer.log('\x1B[36m$data\x1B[36m');
// //         break;
// //       default:
// //         developer.log('\x1B[37m$data\x1B[37m');
// //     }
// //     developer.log('**$text FIN**');
// //   }
// // }

