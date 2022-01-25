import 'package:flutter/material.dart';

import '/data/repository/currencies_repository.dart';
import '/main.dart';
import '/data/models/currency.dart';

import '../widgets/currency_list_tile.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final _currenciesRepository = CurrenciesRepository();

  @override
  Widget build(BuildContext context) {
    if (_currenciesRepository.currenciesList.isEmpty) {
      _currenciesRepository.streamSimulation();
    }
    return StreamBuilder<Currency>(
        stream: _currenciesRepository.currenciesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _currenciesRepository.currenciesList.add(snapshot.data as Currency);
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return CurrencyListTile(
                    currency: _currenciesRepository.currenciesList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: userSettings.isSecondaryHeaderColor(),
                );
              },
              itemCount: _currenciesRepository.currenciesList.length,
            );
          } else {
            const Text('List empty');
          }
          return const CircularProgressIndicator();
        });
  }
}
