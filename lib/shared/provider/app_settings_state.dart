class AppSettingsState {
  bool isDarkMode;
  bool isJapanese;

  AppSettingsState({
    required this.isDarkMode,
    required this.isJapanese,
  });

  AppSettingsState copyWith({
    required bool isDarkMode,
    required bool isJapanese,
  }) {
    return AppSettingsState(
      isDarkMode: isDarkMode,
      isJapanese: isJapanese,
    );
  }
}
