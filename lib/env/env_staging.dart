import 'package:envied/envied.dart';
import 'app_env.dart';

part 'env_staging.g.dart';

@Envied(path: '.env.staging')
final class StagingEnv implements AppEnv {
  StagingEnv();

  @override
  @EnviedField(varName: 'ENVIRONMENT')
  final String environment = _StagingEnv.environment;

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseURL = _StagingEnv.baseURL;

  @override
  @EnviedField(varName: 'IMAGE_BASE_URL')
  final String imageBaseURL = _StagingEnv.imageBaseURL;
}
