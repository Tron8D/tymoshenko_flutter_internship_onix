import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/buttons/converter_button.dart';
import 'package:flutter_intership_onix/buttons/switch_button.dart';
import 'package:flutter_intership_onix/currency_card.dart';
import '../currencies.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({Key? key}) : super(key: key);

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
