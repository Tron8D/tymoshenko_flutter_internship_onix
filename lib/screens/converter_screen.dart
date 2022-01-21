import 'package:flutter/material.dart';

import '../buttons/converter_button.dart';
import '../buttons/switch_button.dart';
import '../currencies.dart';
import '../currency_card.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrencyCard(
          currency: eur,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ConverterButton(),
            SwitchButton(),
          ],
        ),
        const SizedBox(height: 5),
        CurrencyCard(
          currency: uan,
        ),
      ],
    );
  }
}
