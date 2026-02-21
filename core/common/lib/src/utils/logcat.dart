import 'package:logger/web.dart';
import 'package:flutter/foundation.dart';

final logger = Logger(printer: PrettyPrinter());

final class Logcat {
  static void log<T>(T message) {
    if (kDebugMode) {
      debugPrint(message.toString());
    }
  }
}
