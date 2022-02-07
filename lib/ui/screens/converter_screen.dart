import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/ui/providers/converter_provider.dart';
import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/converter_button.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/switch_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_card.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Converter',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: const [SettingsButton()],
      ),
      body: ListView(
        children: [
          Consumer<ConverterProvider>(
            builder: (context, converterProvider, _) {
              if (context
                  .watch<CurrenciesListProvider>()
                  .currenciesList
                  .isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              int _topCardId =
                  context.watch<ConverterProvider>().converter.topCardId;
              Currency _topCardCurrency = context
                  .read<CurrenciesListProvider>()
                  .getCurrencyFromId(_topCardId);
              return CurrencyCard(
                cardIndex: 0,
                readOnly: false,
                currency: _topCardCurrency,
              );
            },
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [ConverterButton(), SwitchButton()],
          ),
          const SizedBox(height: 5),
          Consumer<ConverterProvider>(
            builder: (context, converterProvider, _) {
              if (context
                  .watch<CurrenciesListProvider>()
                  .currenciesList
                  .isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              int _bottomCardId =
                  context.watch<ConverterProvider>().converter.bottomCardId;
              Currency _bottomCardCurrency = context
                  .read<CurrenciesListProvider>()
                  .getCurrencyFromId(_bottomCardId);
              return CurrencyCard(
                cardIndex: 1,
                readOnly: true,
                currency: _bottomCardCurrency,
              );
            },
          ),
        ],
      ),
    );
  }
}
