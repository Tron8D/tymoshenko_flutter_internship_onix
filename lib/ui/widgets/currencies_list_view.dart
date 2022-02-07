import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_list_tile.dart';
import 'package:flutter_intership_onix/utils/utils.dart';

class CurrenciesListView extends StatelessWidget {
  final ListTileCallback onTap;

  const CurrenciesListView({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return CurrencyListTile(
          onTap: onTap,
          currency:
              context.read<CurrenciesListProvider>().currenciesList[index],
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).secondaryHeaderColor,
        );
      },
      itemCount: context.read<CurrenciesListProvider>().currenciesList.length,
    );
  }
}
