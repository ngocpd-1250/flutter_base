import 'env_fields.dart';
import 'env_develop.dart';
import 'env_staging.dart';

abstract class AppEnv implements AppEnvFields {
  static const flavor =
      String.fromEnvironment('FLAVOR', defaultValue: 'develop');

  factory AppEnv() {
    switch (flavor) {
      case 'staging':
        return StagingEnv();
      case 'develop':
      default:
        return DevelopEnv();
    }
  }
}
