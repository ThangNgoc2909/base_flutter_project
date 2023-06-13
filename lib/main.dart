import 'dart:async';
import 'package:base_project/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'injector/injector.dart';
import 'my_app/presentation/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await configureInjection();
  await runZonedGuarded(_runMyApp, _reportError);
}

Future<void> _runMyApp() async {
  runApp(const MyApp());
}

void _reportError(Object error, StackTrace stackTrace) {
  LogUtils.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}
