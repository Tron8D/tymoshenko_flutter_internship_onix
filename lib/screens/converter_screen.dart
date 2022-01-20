import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/buttons/converter_button.dart';
import 'package:flutter_intership_onix/buttons/switch_button.dart';
import 'package:flutter_intership_onix/currency_card.dart';
import 'package:flutter_intership_onix/main.dart';
import '../currencies.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    print('build convert');
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
        Switch(
          value: userSettings.light,
          onChanged: (value) {
            setState(() {
              userSettings.light = value;
              print(userSettings.light);
            });
          },
        ),
      ],
    );
  }
}
