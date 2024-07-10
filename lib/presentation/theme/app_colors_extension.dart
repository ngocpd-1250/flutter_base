import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.backgroundPrimary,
    required this.todoCardBackground,
    required this.backButtonPrimary,
    required this.orangeFlush,
    required this.labelPrimary,
    required this.separatorPrimary,
  });

  final Color primary;
  final Color backgroundPrimary;
  final Color todoCardBackground;
  final Color backButtonPrimary;
  final Color orangeFlush;
  final Color labelPrimary;
  final Color separatorPrimary;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? backgroundPrimary,
    Color? todoCardBackground,
    Color? backButtonPrimary,
    Color? orangeFlush,
    Color? labelPrimary,
    Color? separatorPrimary,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      todoCardBackground: todoCardBackground ?? this.todoCardBackground,
      backButtonPrimary: backButtonPrimary ?? this.backButtonPrimary,
      orangeFlush: orangeFlush ?? this.orangeFlush,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      separatorPrimary: separatorPrimary ?? this.separatorPrimary,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      todoCardBackground:
          Color.lerp(todoCardBackground, other.todoCardBackground, t)!,
      backButtonPrimary:
          Color.lerp(backButtonPrimary, other.backButtonPrimary, t)!,
      orangeFlush: Color.lerp(orangeFlush, other.orangeFlush, t)!,
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t)!,
      separatorPrimary:
          Color.lerp(separatorPrimary, other.separatorPrimary, t)!,
    );
  }
}
