import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyFormField extends StatelessWidget {
  String symbol;
  final bool readOnly;

  CurrencyFormField({Key? key, required this.symbol, required this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 35, color: Theme.of(context).secondaryHeaderColor),
      initialValue: '1.0',
      decoration: InputDecoration(
        suffixText: symbol,
        suffixStyle: TextStyle(
            fontFamily: GoogleFonts.notoSans().fontFamily,
            fontSize: 20,
            color: Theme.of(context).secondaryHeaderColor,
            textBaseline: TextBaseline.alphabetic),
      ),
    );
  }
}
