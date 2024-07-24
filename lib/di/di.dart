import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => getIt.init();
