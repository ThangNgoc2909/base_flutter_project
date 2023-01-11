import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  asExtension: false,
  preferRelativeImports: true,
)
void configureDependencies() => init(injector);
