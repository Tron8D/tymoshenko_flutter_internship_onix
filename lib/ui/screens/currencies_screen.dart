import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/stream_builders/currency_list_stream_builder.dart';

import '/main.dart';

class CurrenciesScreen extends StatefulWidget {
  GestureTapCallback onTap;
  CurrenciesScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => CurrenciesScreenState();
}

class CurrenciesScreenState extends State<CurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    if (currenciesRepository.currenciesList.isEmpty) {
      streams.currencyStreamSimulation();
    }
    return StreamBuilder(
        stream: streams.themeStream(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                'Currencies',
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
              centerTitle: true,
              actions: const [
                SettingsButton(),
              ],
            ),
            body: const CurrencyListStreamBuilder(),
          );
        });
  }
}
