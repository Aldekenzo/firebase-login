import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor primary = MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE9F0FA),
    100: Color(0xFFC8DAF2),
    200: Color(0xFFA4C2EA),
    300: Color(0xFF7FA9E1),
    400: Color(0xFF6396DA),
    500: Color(_primaryValue),
    600: Color(0xFF417CCF),
    700: Color(0xFF3871C9),
    800: Color(0xFF3067C3),
    900: Color(0xFF2154B9),
  });
  static const int _primaryValue = 0xFF075234;

  static const MaterialColor secondary = MaterialColor(_secondaryValue, <int, Color>{
    50: Color(0xFFFEF9E3),
    100: Color(0xFFFDF1B9),
    200: Color(0xFFFBE88B),
    300: Color(0xFFF9DF5D),
    400: Color(0xFFF8D83A),
    500: Color(_secondaryValue),
    600: Color(0xFFF6CC14),
    700: Color(0xFFF5C611),
    800: Color(0xFFF3C00D),
    900: Color(0xFFF1B507),
  });
  static const int _secondaryValue = 0xFFF7D117;

  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFF3F7FF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF8DB0FF),
    700: Color(0xFF749EFF),
  });
  static const int _primaryAccentValue = 0xFFC0D3FF;

  static const MaterialColor success = MaterialColor(_successValue, <int, Color>{
    50: Color(0xFFE3F9E7),
    100: Color(0xFFBAEFC3),
    200: Color(0xFF8CE59B),
    300: Color(0xFF5DDA72),
    400: Color(0xFF3BD254),
    500: Color(_successValue),
    600: Color(0xFF15C530),
    700: Color(0xFF11BD29),
    800: Color(0xFF0EB722),
    900: Color(0xFF08AB16),
  });
  static const int _successValue = 0xFF00BE5A;

  static const MaterialColor danger = MaterialColor(_dangerValue, <int, Color>{
    50: Color(0xFFFAE9E6),
    100: Color(0xFFF2C8C1),
    200: Color(0xFFE9A398),
    300: Color(0xFFE07E6E),
    400: Color(0xFFD9624F),
    500: Color(_dangerValue),
    600: Color(0xFFCD3F2B),
    700: Color(0xFFC73724),
    800: Color(0xFFC12F1E),
    900: Color(0xFFB62013),
  });
  static const int _dangerValue = 0xFFD24630;

  static const Color blackText = Color(0xFF12121D);

  static const Color primaryText = Color(0xFF1E385B);
  static const Color inactiveText = Color(0xFF6F839A);
  static const Color iconText = Color(0xFF699DB7);

  static const Color greyLight = Color(0xFFE5E5E5);
  static const Color greyDark = Color(0xFFE5EBF0);

  static const Color bottomBarPrimary = Color(0xFF0B6EC7);
  static const Color bottomBarInactive = Color(0xFFBBCCDB);

  // new colors

  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);
  static const Color kGreen = Color(0xFF075234);

  static const Color backgroundColor = Color(0xFFFFE4C7);
  static const Color kRed = Color(0xFFE46472);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kBadGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);
}
