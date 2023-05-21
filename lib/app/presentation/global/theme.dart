import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData getTheme(bool darkMode) {
  if (darkMode) {
    final darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
      progressIndicatorTheme: darkTheme.progressIndicatorTheme.copyWith(
        color: const Color(0xFFFFDE00),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF000033), // Azul Oscuro Profundo
        secondary: Color(0xFFFFDE00), // Amarillo Canario
        background: Color(0xFF0D0D0D), // Negro Suave
        onBackground: Color(0xFFD9D9D9), // Gris Claro
      ),
      textTheme: GoogleFonts.openSansTextTheme(
        darkTheme.textTheme,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
          AppColors.secundaryDark.withOpacity(0.5),
        ),
      ),
    );
  }
  final lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF003459), // Azul Marino
      secondary: Color(0xFFFFDE00), // Amarillo Canario
      background: Color(0xFFFAFAFA), // Blanco Suave
      onBackground: Color(0xFF000033), // Azul Oscuro
    ),
    textTheme: GoogleFonts.openSansTextTheme(
      lightTheme.textTheme,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(
        AppColors.secundaryLight.withOpacity(0.5),
      ),
    ),
  );
}
