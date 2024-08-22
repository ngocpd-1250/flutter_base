class SettingsState {
  bool isDarkMode;
  bool isJapanese;

  SettingsState({
    required this.isDarkMode,
    required this.isJapanese,
  });

  SettingsState copyWith({
    required bool isDarkMode,
    required bool isJapanese,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode,
      isJapanese: isJapanese,
    );
  }
}
