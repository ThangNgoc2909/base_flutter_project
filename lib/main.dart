import 'dart:async';
import 'package:base_project/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'helper/run_catching/run_catching.dart';
import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await configureInjection();
  await runZonedGuarded(_runMyApp, _reportError);
}

Future<LoadInitialResourceOutput> _loadInitialResource() async {
  final result = runCatching(
    action: () =>
        GetIt.instance.get<LoadInitialResourceUseCase>().execute(const LoadInitialResourceInput()),
  );

  return result.when(
    success: (output) => output,
    failure: (e) => const LoadInitialResourceOutput(),
  );
}

Future<void> _runMyApp() async {
  final initialResource = await _loadInitialResource();
  runApp(MyApp(initialResource: initialResource));
}

void _reportError(Object error, StackTrace stackTrace) {
  LogUtils.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}
