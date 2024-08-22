import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/usecase_provider.dart';
import 'package:base_flutter/domain/usecases/set_darkmode_usecase.dart';
import 'package:base_flutter/domain/usecases/set_japanese_language_usecase.dart';
import 'package:base_flutter/shared/provider/app_settings_state.dart';

part 'app_settings.g.dart';

@riverpod
class AppSettings extends _$AppSettings {
  @override
  AppSettingsState build() {
    final isDarkMode = ref.read(getDarkModeUseCaseProvider).execute();
    final isJapanese = ref.read(getJapaneseLanguageUseCaseProvider).execute();
    return AppSettingsState(isDarkMode: isDarkMode, isJapanese: isJapanese);
  }

  void setDarkMode(bool isDarkMode) {
    final input = SetDarkModeInput(isDarkMode: isDarkMode);
    ref.read(setDarkModeUseCaseProvider).execute(input);
    state = state.copyWith(
      isDarkMode: isDarkMode,
      isJapanese: state.isJapanese,
    );
  }

  void setJapaneseLanguage(bool isJapanese) {
    final input = SetJapaneseLanguageInput(isJapaneseLanguage: isJapanese);
    ref.read(setJapaneseLanguageUseCaseProvider).execute(input);
    state = state.copyWith(
      isDarkMode: state.isDarkMode,
      isJapanese: isJapanese,
    );
  }
}
