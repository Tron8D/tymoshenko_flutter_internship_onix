import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';

import '../../../main.dart';
import '../currency_list_tile.dart';

class CurrencyListStreamBuilder extends StatelessWidget {
  const CurrencyListStreamBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Currency>(
        stream: streams.currenciesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData ||
              currenciesRepository.currenciesList.isNotEmpty) {
            if (snapshot.data != null) {
              currenciesRepository.currenciesList
                  .add(snapshot.data as Currency);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return CurrencyListTile(
                    currency: currenciesRepository.currenciesList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                );
              },
              itemCount: currenciesRepository.currenciesList.length,
            );
          } else {
            const Text('List empty');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
