import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_it/common/constants/theme_constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: cPrimaryColor,
    scaffoldBackgroundColor: cBackgroundColorLightTheme,
    iconTheme: const IconThemeData(color: cContentColorLightTheme),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: cContentColorLightTheme),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      hintStyle: const TextStyle().copyWith(color: cPlaceholderLightTheme),
    ),
    colorScheme: const ColorScheme.light(
      primary: cPrimaryColor,
      secondary: cSecondaryColor,
      error: cErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: cPrimaryColor,
    scaffoldBackgroundColor: cBackgroundColorDarkTheme,
    iconTheme: const IconThemeData(color: cContentColorDarkTheme),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: cContentColorDarkTheme),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      hintStyle: const TextStyle().copyWith(color: cPlaceholderDarkTheme.withOpacity(0.8)),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: cPrimaryColor,
      secondary: cSecondaryColor,
      error: cErrorColor,
    ),
  );
}
