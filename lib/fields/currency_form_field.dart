import 'package:flutter/material.dart';

class CurrencyFormField extends StatelessWidget {
  final String symbol;
  const CurrencyFormField({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 35, color: Theme.of(context).secondaryHeaderColor),
      initialValue: '1.0',
      decoration: InputDecoration(
        suffixText: symbol,
        suffixStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).secondaryHeaderColor,
            textBaseline: TextBaseline.alphabetic),
      ),
    );
  }
}
