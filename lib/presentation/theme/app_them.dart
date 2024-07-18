import 'package:flutter/material.dart';

import 'app_colors_extension.dart';
import 'app_text_theme_extension.dart';
import 'app_typography.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.bodyMedium.copyWith(color: Colors.black),
      ),
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xFF6868AA),
    backgroundPrimary: const Color(0xFFECECEC),
    todoCardBackground: const Color(0xFFFFFFFF),
    backButtonPrimary: const Color(0xFF0E0F0F),
    orangeFlush: const Color(0xFFFF8700),
    labelPrimary: const Color(0xFF161616),
    separatorPrimary: const Color(0xFFD4D6D6),
  );

  static final _lightTextTheme = AppTextThemeExtension(
    displayLarge: AppTypography.displayLarge.copyWith(color: Colors.black),
    displayMedium: AppTypography.displayMedium.copyWith(color: Colors.black),
    displaySmall: AppTypography.displaySmall.copyWith(color: Colors.black),
    headlineLarge: AppTypography.headlineLarge.copyWith(color: Colors.black),
    headlineMedium: AppTypography.headlineMedium.copyWith(color: Colors.black),
    headlineSmall: AppTypography.headlineSmall.copyWith(color: Colors.black),
    titleLarge: AppTypography.titleLarge.copyWith(color: Colors.black),
    titleMedium: AppTypography.titleMedium.copyWith(color: Colors.black),
    titleSmall: AppTypography.titleSmall.copyWith(color: Colors.black),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: Colors.black),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: Colors.black),
    bodySmall: AppTypography.bodySmall.copyWith(color: Colors.black),
    labelLarge: AppTypography.labelLarge.copyWith(color: Colors.black),
  );

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.bodyMedium.copyWith(color: Colors.white),
      ),
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xFF7877C0),
    backgroundPrimary: const Color(0xFF242A32),
    todoCardBackground: const Color(0xFFFFFFFF),
    backButtonPrimary: const Color(0xFFFAFDFD),
    orangeFlush: const Color(0xFFFF8700),
    labelPrimary: const Color(0xFFF8FBFB),
    separatorPrimary: const Color(0xFFE3E5E5),
  );

  static final _darkTextTheme = AppTextThemeExtension(
    displayLarge: AppTypography.displayLarge.copyWith(color: Colors.white),
    displayMedium: AppTypography.displayMedium.copyWith(color: Colors.white),
    displaySmall: AppTypography.displaySmall.copyWith(color: Colors.white),
    headlineLarge: AppTypography.headlineLarge.copyWith(color: Colors.white),
    headlineMedium: AppTypography.headlineMedium.copyWith(color: Colors.white),
    headlineSmall: AppTypography.headlineSmall.copyWith(color: Colors.white),
    titleLarge: AppTypography.titleLarge.copyWith(color: Colors.white),
    titleMedium: AppTypography.titleMedium.copyWith(color: Colors.white),
    titleSmall: AppTypography.titleSmall.copyWith(color: Colors.white),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: Colors.white),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: Colors.white),
    bodySmall: AppTypography.bodySmall.copyWith(color: Colors.white),
    labelLarge: AppTypography.labelLarge.copyWith(color: Colors.white),
  );
}

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTextThemeExtension get appTextTheme =>
      extension<AppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
