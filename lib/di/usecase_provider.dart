import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/repository_provider.dart';
import 'package:base_flutter/domain/usecases/complete_onboarding_usecase.dart';
import 'package:base_flutter/domain/usecases/get_darkmode_usecase.dart';
import 'package:base_flutter/domain/usecases/get_japanese_language_usecase.dart';
import 'package:base_flutter/domain/usecases/login_usecase.dart';
import 'package:base_flutter/domain/usecases/logout_usecase.dart';
import 'package:base_flutter/domain/usecases/register_usecase.dart';
import 'package:base_flutter/domain/usecases/set_darkmode_usecase.dart';
import 'package:base_flutter/domain/usecases/set_japanese_language_usecase.dart';

part 'usecase_provider.g.dart';

@riverpod
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
  return RegisterUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
CompleteOnboardingUseCase completeOnboardingUseCase(
    CompleteOnboardingUseCaseRef ref) {
  return CompleteOnboardingUseCase(ref.watch(appRepositoryProvider));
}

@riverpod
SetDarkModeUseCase setDarkModeUseCase(SetDarkModeUseCaseRef ref) {
  return SetDarkModeUseCase(ref.watch(appRepositoryProvider));
}

@riverpod
GetDarkModeUseCase getDarkModeUseCase(GetDarkModeUseCaseRef ref) {
  return GetDarkModeUseCase(ref.watch(appRepositoryProvider));
}

@riverpod
SetJapaneseLanguageUseCase setJapaneseLanguageUseCase(
    SetJapaneseLanguageUseCaseRef ref) {
  return SetJapaneseLanguageUseCase(ref.watch(appRepositoryProvider));
}

@riverpod
GetJapaneseLanguageUseCase getJapaneseLanguageUseCase(
    GetJapaneseLanguageUseCaseRef ref) {
  return GetJapaneseLanguageUseCase(ref.watch(appRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}
