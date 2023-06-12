import 'dart:async';
import 'package:base_project/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'helper/run_catching/run_catching.dart';
import 'injector/injector.dart';
import 'my_app/presentation/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await configureInjection();
  await runZonedGuarded(_runMyApp, _reportError);
}

FutureOr loadInitialResource() {}

Future<void> _runMyApp() async {
  final initialResource = await loadInitialResource();
  runApp(MyApp(initialResource: initialResource));
}

void _reportError(Object error, StackTrace stackTrace) {
  LogUtils.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}
