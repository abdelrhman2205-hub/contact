import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.darkBlue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColor.gold,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColor.gold,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: AppColor.gold,
        fontWeight: FontWeight.normal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.gold,
        foregroundColor: AppColor.darkBlue,
        overlayColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        elevation: 0,
      ),
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColor.darkBlue,
  hintStyle: const TextStyle(
  color: AppColor.lightBlue,
  fontSize: 16,
  fontWeight: FontWeight.w400, // Regular
  ),
  contentPadding: const EdgeInsets.all(16),
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: const BorderSide(
  width: 2,
  color: AppColor.gold,
  ),
  ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: const BorderSide(
  width: 2,
  color: AppColor.gold,
  ),
  ),
  errorBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: BorderSide(
  width: 2,
  color: AppColor.red,
  ),
  ),
  focusedErrorBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: const BorderSide(
  width: 2,
  color: AppColor.red,
  ),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  // Hint stays inside field
  );

  late final textFieldTheme = ThemeData(
  inputDecorationTheme: inputDecorationTheme,
  textSelectionTheme: const TextSelectionThemeData(
  cursorColor: AppColor.gold,
  ),
  );

}
