import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeData() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff3d3d3d),
      secondaryHeaderColor: const Color(0xff4d3dad),
      scaffoldBackgroundColor: const Color(0xffbfbfbf),
      cardColor: const Color(0xffb5b8bf),
      fontFamily: GoogleFonts.montserrat().fontFamily,
    );
