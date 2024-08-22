import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/usecase_provider.dart';
import 'package:base_flutter/presentation/pages/settings/settings_state.dart';
import 'package:base_flutter/shared/provider/app_settings.dart';

part 'settings_view_model.g.dart';

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  SettingsState build() {
    final isDarkMode = ref.read(appSettingsProvider).isDarkMode;
    final isJapanese = ref.read(appSettingsProvider).isJapanese;
    return SettingsState(isDarkMode: isDarkMode, isJapanese: isJapanese);
  }

  void setDarkMode(bool isDarkMode) {
    ref.read(appSettingsProvider.notifier).setDarkMode(isDarkMode);
    state =
        state.copyWith(isDarkMode: isDarkMode, isJapanese: state.isJapanese);
  }

  void setJapaneseLanguage(bool isJapanese) {
    ref.read(appSettingsProvider.notifier).setJapaneseLanguage(isJapanese);
    state =
        state.copyWith(isDarkMode: state.isDarkMode, isJapanese: isJapanese);
  }

  void logout() {
    ref.read(logoutUseCaseProvider).execute();
  }
}
