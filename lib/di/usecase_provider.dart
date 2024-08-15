import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/repository_provider.dart';
import 'package:base_flutter/domain/usecases/login_usecase.dart';

part 'usecase_provider.g.dart';

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}
