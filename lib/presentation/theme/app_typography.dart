import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTypography {
  static TextStyle displayLarge = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayMedium = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaySmall = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineLarge = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineSmall = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleLarge = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle labelLarge = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
