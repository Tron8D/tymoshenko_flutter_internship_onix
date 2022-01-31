import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/main.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_list_tile.dart';
import 'package:flutter_intership_onix/utils/utils.dart';

class CurrencyListStreamBuilder extends StatelessWidget {
  final ListTileCallback onTap;

  const CurrencyListStreamBuilder({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Currency>>(
      stream: streams.currenciesStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Currency>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (!snapshot.hasData &&
            currenciesRepository.currenciesList.isEmpty) {
          return const Text('List empty');
        } else {
          if (snapshot.hasData) {
            currenciesRepository.currenciesList = snapshot.data!;
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return CurrencyListTile(
                onTap: onTap,
                currency: currenciesRepository.currenciesList[index],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).secondaryHeaderColor,
              );
            },
            itemCount: currenciesRepository.currenciesList.length,
          );
        }
      },
    );
  }
}
