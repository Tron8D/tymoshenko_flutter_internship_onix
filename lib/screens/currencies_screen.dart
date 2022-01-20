import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/tiles/currency_list_tile.dart';
import 'package:flutter_intership_onix/currencies.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  List currencyList = [
    CurrencyListTile(currency: usd),
    CurrencyListTile(currency: eur),
    CurrencyListTile(currency: uan),
  ];

  @override
  Widget build(BuildContext context) {
    print('build curren');
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return currencyList[index];
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).secondaryHeaderColor,
        );
      },
      itemCount: 3,
    );
  }
}
