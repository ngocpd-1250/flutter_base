import 'package:envied/envied.dart';
import 'app_env.dart';

part 'env_develop.g.dart';

@Envied(path: '.env.develop')
final class DevelopEnv implements AppEnv {
  DevelopEnv();

  @override
  @EnviedField(varName: 'ENVIRONMENT')
  final String environment = _DevelopEnv.environment;

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseURL = _DevelopEnv.baseURL;

  @override
  @EnviedField(varName: 'IMAGE_BASE_URL')
  final String imageBaseURL = _DevelopEnv.imageBaseURL;
}
