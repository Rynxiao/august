import 'package:flutter/material.dart';

import 'colors.dart';
import 'fontsize.dart';
import 'fontweight.dart';

// Light theme colors
const Color _lightPrimaryColor = AppColors.orangeRed;
const Color _lightOnPrimaryColor = AppColors.white;
const Color _lightSecondaryColor = AppColors.lightGray;
const Color _lightOnSecondaryColor = AppColors.black;
const Color _lightBackgroundColor = AppColors.white;
const Color _lightOnBackgroundColor = AppColors.lightBlack;
const Color _lightErrorColor = AppColors.orangeRed;
const Color _lightOnErrorColor = AppColors.white;
const Color _lightSurfaceColor = AppColors.black;
const Color _lightOnSurfaceColor = AppColors.black;
const Color _lightHighlightColor = AppColors.orangeRed;
const Color _lightHintColor = AppColors.black;
const Color _lightDividerColor = AppColors.lightGray;

// Dark theme colors
const Color _darkPrimaryColor = AppColors.orangeRed;
const Color _darkOnPrimaryColor = AppColors.black;
const Color _darkSecondaryColor = AppColors.black;
const Color _darkOnSecondaryColor = AppColors.white;
const Color _darkBackgroundColor = AppColors.lightBlack;
const Color _darkOnBackgroundColor = AppColors.white;
const Color _darkErrorColor = AppColors.orangeRed;
const Color _darkOnErrorColor = AppColors.black;
const Color _darkSurfaceColor = AppColors.white;
const Color _darkOnSurfaceColor = AppColors.white;
const Color _darkHighlightColor = AppColors.orangeRed;
const Color _darkHintColor = AppColors.white;
const Color _darkDividerColor = AppColors.lightGray;

// Light theme
final ThemeData lightTheme = ThemeData(
  primaryColor: _lightPrimaryColor,
  highlightColor: _lightHighlightColor,
  hintColor: _lightHintColor,
  dividerColor: _lightDividerColor,
  scaffoldBackgroundColor: _lightBackgroundColor,
  iconTheme: const IconThemeData(color: AppColors.black),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.medium,
      fontWeight: AppFontWeight.semiBold,
    ),
    bodyMedium: TextStyle(
      color: AppColors.black,
      fontWeight: AppFontWeight.regular,
      fontSize: AppFontSize.large,
    ),
    labelMedium: TextStyle(
      color: AppColors.black,
      fontWeight: AppFontWeight.regular,
      fontSize: AppFontSize.fontSize_11,
    ),
    labelSmall: TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.fontSize_8,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _lightPrimaryColor,
    onPrimary: _lightOnPrimaryColor,
    secondary: _lightSecondaryColor,
    onSecondary: _lightOnSecondaryColor,
    background: _lightBackgroundColor,
    onBackground: _lightOnBackgroundColor,
    error: _lightErrorColor,
    onError: _lightOnErrorColor,
    surface: _lightSurfaceColor,
    onSurface: _lightOnSurfaceColor,
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  primaryColor: _darkPrimaryColor,
  highlightColor: _darkHighlightColor,
  hintColor: _darkHintColor,
  dividerColor: _darkDividerColor,
  scaffoldBackgroundColor: _darkBackgroundColor,
  iconTheme: const IconThemeData(color: AppColors.white),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.medium,
      fontWeight: AppFontWeight.semiBold,
    ),
    bodyMedium: TextStyle(
      color: AppColors.white,
      fontWeight: AppFontWeight.regular,
      fontSize: AppFontSize.large,
    ),
    bodySmall: TextStyle(
      color: AppColors.white,
      fontWeight: AppFontWeight.regular,
      fontSize: AppFontSize.fontSize_11,
    ),
    labelSmall: TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.fontSize_8,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: _darkPrimaryColor,
    onPrimary: _darkOnPrimaryColor,
    secondary: _darkSecondaryColor,
    onSecondary: _darkOnSecondaryColor,
    background: _darkBackgroundColor,
    onBackground: _darkOnBackgroundColor,
    error: _darkErrorColor,
    onError: _darkOnErrorColor,
    surface: _darkSurfaceColor,
    onSurface: _darkOnSurfaceColor,
  ),
);
