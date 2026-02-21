import 'dart:async';
import 'package:app/application/playground_app.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';


void runMainApp(ApplicationFlavorType type) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      safeSync("ApplicationFlavor.init", () => ApplicationFlavor.init(type));
      runApp(const PlaygroundApp());
    },
    (e, s) {
      Logcat.log('Uncaught zone error: $e\n$s');
    },
  );
}
