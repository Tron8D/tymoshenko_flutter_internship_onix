import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSettings {
  bool dark;
  UserSettings({this.dark = false});

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xffEBEFF7),
    secondaryHeaderColor: const Color(0xff4d3dad),
    scaffoldBackgroundColor: const Color(0xffDDE2F9),
    cardColor: const Color(0xffEBEFF7),
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff3d3d3d),
    secondaryHeaderColor: const Color(0xff4d3dad),
    scaffoldBackgroundColor: const Color(0xffbfbfbf),
    cardColor: const Color(0xffb5b8bf),
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
}
