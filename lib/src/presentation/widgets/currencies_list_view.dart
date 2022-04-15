import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/presentation/widgets/currency_list_tile.dart';
import 'package:flutter_intership_onix/src/utils/utils.dart';

class CurrenciesListView extends StatelessWidget {
  final ListTileCallback onTap;
  final List<Currency> currenciesList;

  const CurrenciesListView({
    Key? key,
    required this.onTap,
    required this.currenciesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return CurrencyListTile(
          onTap: onTap,
          currency: currenciesList[index],
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).secondaryHeaderColor,
        );
      },
      itemCount: currenciesList.length,
    );
  }
}
