import 'package:flutter/material.dart';

ThemeData lightThemeData() => ThemeData(
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Color(0xff4d3dad)),
        iconTheme: IconThemeData(color: Color(0xff4d3dad)),
      ),
      brightness: Brightness.light,
      primaryColor: const Color(0xffEBEFF7),
      secondaryHeaderColor: const Color(0xff4d3dad),
      scaffoldBackgroundColor: const Color(0xffDDE2F9),
      cardColor: const Color(0xffEBEFF7),
      fontFamily: 'Montserrat',
    );
