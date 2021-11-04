import 'package:authtest/core/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double borderRadius = 5.0;
  static const double buttonHeight = 50.0;
  static const double inputBorderWidth = 0.6;

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      primarySwatch: AppColors.primary,
      primaryColor: AppColors.primary.shade500,
      primaryColorBrightness: Brightness.light,
      accentColor: AppColors.secondary,
      accentColorBrightness: Brightness.light,
      errorColor: AppColors.danger,
      fontFamily: 'Montserrat',
      // Scaffold
      scaffoldBackgroundColor: AppColors.backgroundColor,
      backgroundColor: AppColors.kRed,
      // App Bar
      appBarTheme: AppBarTheme(
        color: Colors.white,
        brightness: Brightness.light,
        elevation: 8,
        shadowColor: Colors.black26,
        centerTitle: true,
        actionsIconTheme: IconThemeData(
          color: AppColors.primary,
        ),
      ),
      // Text theme
      primaryColorLight: AppColors.primaryAccent,
      splashColor: AppColors.primary.withOpacity(0.14),
      highlightColor: Colors.transparent,
      dividerColor: AppColors.greyDark,
      textTheme: TextTheme(
        headline2: TextStyle(
          fontSize: 22,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontSize: 22,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        headline4: TextStyle(
          fontSize: 20,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w700,
        ),
        headline5: TextStyle(
          fontSize: 18,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        headline6: TextStyle(
          fontSize: 16,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          color: AppColors.primaryText,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        bodyText1: TextStyle(
          fontSize: 12,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          color: AppColors.primaryText,
          fontWeight: FontWeight.normal,
        ),
        caption: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),

      // Form
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        hintStyle: TextStyle(fontSize: 14, color: AppColors.inactiveText),
        labelStyle: TextStyle(color: AppColors.inactiveText),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.danger,
            width: inputBorderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.danger,
            width: inputBorderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
