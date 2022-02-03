import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData() => ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xffEBEFF7),
      secondaryHeaderColor: const Color(0xff4d3dad),
      scaffoldBackgroundColor: const Color(0xffDDE2F9),
      cardColor: const Color(0xffEBEFF7),
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
