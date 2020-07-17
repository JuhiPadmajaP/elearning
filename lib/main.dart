import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
// ignore: unused_import
import 'package:E_Learning_App/page1.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListParts(),
    );
  }
}
