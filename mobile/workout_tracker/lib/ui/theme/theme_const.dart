import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

bool _lightTheme = false;

class ThemeConst {
  static const _errorFillColor = Color(0xFFFB2424);
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = getThemeData(_lightColorScheme, _lightFocusColor, isLightTheme: true);


  static ThemeData getThemeData(ColorScheme colorScheme, Color focusColor,
      {bool isLightTheme = true}) {
    _lightTheme = isLightTheme; // to get the light colors from extension
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      textTheme: GoogleFonts.poppinsTextTheme( _textThemeLight(colorScheme)),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        toolbarTextStyle:GoogleFonts.poppinsTextTheme( _textThemeLight(colorScheme))
            .apply(bodyColor: colorScheme.onPrimary).labelLarge, titleTextStyle: _textThemeLight(colorScheme)
          .apply(bodyColor: colorScheme.onPrimary).labelMedium,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      buttonTheme: const ButtonThemeData(
        minWidth: 50,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
        Color.alphaBlend(_lightFillColor.withOpacity(0.80), _darkFillColor),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: colorScheme.copyWith(secondary: colorScheme.primary),
    );
  }


  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF336699),
    // changed to new theme
    secondary: Color(0xFFB5E7FE),
    // changed to new theme
    background: Colors.white,
    surface: Colors.white,
    onBackground: Colors.white,
    error: _errorFillColor,
    onError: _errorFillColor,
    onPrimary: Color(0xFFB5E7FE),
    onSecondary: Color(0xFFB5E7FE),
    onSurface:  Colors.white,
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600; // not used
  static const _bold = FontWeight.w700;

  static TextTheme _textThemeLight(ColorScheme colorScheme) {
    return TextTheme(

      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _bold,
        fontSize: 40.sp, // Recommended size for displayLarge
        color: colorScheme.primaryTextColor,
      ),
      displayMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 32.sp, // Recommended size for displayMedium
        color: colorScheme.primaryTextColor,
      ),
      displaySmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _medium,
        fontSize: 24.sp, // Recommended size for displaySmall
        color: colorScheme.primaryTextColor,
      ),

      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 32.sp, // Recommended size for headlineLarge
        color: colorScheme.primaryTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _medium,
        fontSize: 24.sp, // Recommended size for headlineMedium
        color: colorScheme.primaryTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _regular,
        fontSize: 20.sp, // Recommended size for headlineSmall
        color: colorScheme.primaryTextColor,
      ),

      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 28.sp, // Recommended size for titleLarge
        color: colorScheme.primaryTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 24.sp, // Recommended size for titleMedium
        color: colorScheme.primaryTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 20.sp, // Recommended size for titleSmall
        color: colorScheme.primaryTextColor,
      ),

      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _medium,
        fontSize: 18.sp, // Recommended size for bodyLarge
        color: colorScheme.primaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _regular,
        fontSize: 16.sp, // Recommended size for bodyMedium
        color: colorScheme.secondaryTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _regular,
        fontSize: 14.sp, // Recommended size for bodySmall
        color: colorScheme.secondaryTextColor,
      ),

      labelLarge: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 16.sp, // Recommended size for labelLarge
        color: colorScheme.primaryTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _regular,
        fontSize: 14.sp, // Recommended size for labelMedium
        color: colorScheme.secondaryTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontWeight: _semiBold,
        fontSize: 12.sp, // Recommended size for labelMedium
        color: colorScheme.secondaryTextColor,
      ),

    );
  }
}

extension ColorExtends on ColorScheme {
  static const primaryColorl = Color(0xFF336699);
  static const primaryColorD = Color(0xFF336699);
  static const primaryColorLightl = Color(0xFFB5E7FE);
  static const primaryColorLightD = Color(0xFFB5E7FE);
  static const greyl = Color(0xFFD9D9D9);
  static const greyD = Color(0xFFD9D9D9);
  static const greyLightl = Color(0xFFF5F5F5);
  static const greyLightD = Color(0xFFF5F5F5);
  static const whitel = Color(0xFFFFFFFF);
  static const whiteD = Color(0xFFFFFFFF);
  static const primaryTextColorl = Color(0xFF555555);
  static const primaryTextColorD = Color(0xFF555555);
  static const secondaryTextColorl = Color(0xFF707070);
  static const secondaryTextColorD = Color(0xFF707070);
  static const redl = Color(0xFFFB2424);
  static const redD = Color(0xFFFB2424);

  Color get primaryColor => _lightTheme ? primaryColorl : primaryColorD;
  Color get primaryColorLight => _lightTheme ? primaryColorLightl : primaryColorLightD;
  Color get grey => _lightTheme ? greyl : greyD;
  Color get greyLight => _lightTheme ? greyLightl : greyLightD;
  Color get white => _lightTheme ? whitel : whiteD;
  Color get primaryTextColor => _lightTheme ? primaryTextColorl : primaryTextColorD;
  Color get secondaryTextColor => _lightTheme ? secondaryTextColorl : secondaryTextColorD;
  Color get red => _lightTheme ? redl : redD;

}
