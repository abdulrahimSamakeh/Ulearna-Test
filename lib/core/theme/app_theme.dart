import 'package:flutter/material.dart';

import '../resource/color_manger.dart';
import '../resource/font_manger.dart';
import '../resource/size_manger.dart';

const primaryColor = AppColorManger.mainAppColor;
const secondryColor = AppColorManger.secondaryAppColor;

//!App Text Theme
TextTheme appTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs28,
    fontWeight: FontWeightManger.semiBoldWeight,
    color: AppColorManger.white,
  ),
  displayMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs16,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.white,
  ),
  displaySmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    color: AppColorManger.mainAppColor,
    fontWeight: FontWeightManger.semiBoldWeight,
  ),
  headlineLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs20,
    fontWeight: FontWeightManger.boldWeight,
    color: AppColorManger.textAppColor,
  ),
  headlineMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs16,
    fontWeight: FontWeightManger.semiBoldWeight,
    color: AppColorManger.textAppColor,
  ),
  headlineSmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.textAppColor,
  ),
  titleLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs22,
    fontWeight: FontWeightManger.boldWeight,
    color: AppColorManger.white,
  ),
  bodyLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    fontWeight: FontWeight.normal,
    color: AppColorManger.textAppColor,
  ),
  bodyMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.textAppColor,
  ),
  bodySmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs11,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.greyAppColor,
  ),
);

//Dark Text Theme
TextTheme appTextThemeDark = TextTheme(
  displayLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs28,
    fontWeight: FontWeightManger.semiBoldWeight,
    color: AppColorManger.white,
  ),
  displayMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs16,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.white,
  ),
  displaySmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    color: AppColorManger.white,
    fontWeight: FontWeightManger.semiBoldWeight,
  ),
  headlineLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs20,
    fontWeight: FontWeightManger.boldWeight,
    color: AppColorManger.white,
  ),
  headlineMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs16,
    fontWeight: FontWeightManger.semiBoldWeight,
    color: AppColorManger.white,
  ),
  headlineSmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.white,
  ),
  titleLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs22,
    fontWeight: FontWeightManger.boldWeight,
    color: AppColorManger.white,
  ),
  bodyLarge: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs14,
    fontWeight: FontWeight.normal,
    color: AppColorManger.white,
  ),
  bodyMedium: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs13,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.white,
  ),
  bodySmall: TextStyle(
    fontFamily: FontFamilyManager.cairo,
    fontSize: FontSizeManger.fs11,
    fontWeight: FontWeightManger.normalWeight,
    color: AppColorManger.greyAppColor,
  ),
);

//!App Light Theme
ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
    ),
    brightness: Brightness.light,
    primaryColorLight: AppColorManger.mainAppColor,
    primaryColorDark: AppColorManger.mainAppColor,
    scaffoldBackgroundColor: AppColorManger.backgroundAppColor,
    splashColor: AppColorManger.white,
    fontFamily: FontFamilyManager.cairo,
    primaryColor: primaryColor,
    textTheme: appTextTheme,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor, foregroundColor: secondryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorManger.white,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r4),
        borderSide: const BorderSide(
          color: AppColorManger.redAppColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r4),
        borderSide: const BorderSide(
          color: AppColorManger.redAppColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
        borderSide: const BorderSide(color: AppColorManger.hintAppColor),
      ),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManger.p16, vertical: AppPaddingManger.p8),
      hintStyle: TextStyle(
        color: AppColorManger.hintAppColor,
        fontSize: FontSizeManger.fs16,
        fontWeight: FontWeight.normal,
      ),
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
      ),
      iconColor: secondryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorManger.mainAppColor),
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(AppRadiusManger.r5),
      ),
    ),
    colorScheme: const ColorScheme.light(primary: primaryColor)
        .copyWith(secondary: AppColorManger.mainAppColor)
        .copyWith(secondary: AppColorManger.mainAppColorGradient),
    // Define the default button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColorManger.mainAppColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

//!App Dark Theme
ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: appTextThemeDark,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorManger.secondaryAppColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorManger.secondaryAppColor,
      centerTitle: true,
    ),
    splashColor: AppColorManger.white,
    brightness: Brightness.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorManger.secondaryAppColor,
        foregroundColor: secondryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorManger.white,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r4),
        borderSide: const BorderSide(
          color: AppColorManger.redAppColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r4),
        borderSide: const BorderSide(
          color: AppColorManger.redAppColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
        borderSide: const BorderSide(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManger.p16, vertical: AppPaddingManger.p8),
      hintStyle: TextStyle(
        color: AppColorManger.greyAppColor,
        fontSize: FontSizeManger.fs16,
        fontWeight: FontWeight.normal,
      ),
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
      ),
      iconColor: secondryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorManger.secondaryAppColor),
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: AppColorManger.secondaryAppColor,
        borderRadius: BorderRadius.circular(AppRadiusManger.r5),
      ),
    ),
    colorScheme: const ColorScheme.dark(primary: primaryColor)
        .copyWith(secondary: AppColorManger.mainAppColor)
        .copyWith(secondary: AppColorManger.mainAppColorGradient),

    // Define the default button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColorManger.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
