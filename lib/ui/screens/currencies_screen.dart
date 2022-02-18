import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currencies_list_view.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/list_error.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Currencies',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: const [SettingsButton()],
      ),
      body: Consumer<CurrenciesListProvider>(
        builder: (context, currenciesListProvider, _) {
          if (currenciesListProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (currenciesListProvider.error != null) {
            return ListError(
                error: currenciesListProvider.error!,
                onPressed: () => currenciesListProvider.getCurrenciesList());
          } else if (currenciesListProvider.currenciesList.isEmpty) {
            return const Center(child: Text('List empty.'));
          } else {
            return CurrenciesListView(onTap: (id) {
              _onTap(context, id);
            });
          }
        },
      ),
    );
  }

  void _onTap(BuildContext context, int id) {
    Currency currency =
        context.read<CurrenciesListProvider>().getCurrencyFromId(id);
    Navigator.of(context).pushNamed('/info_card_screen', arguments: currency);
  }
}
