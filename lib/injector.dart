import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
GetIt injector = GetIt.asNewInstance();

Future<void> initInjector() async {
  injector.registerSingleton<Dio>(Dio());
}
