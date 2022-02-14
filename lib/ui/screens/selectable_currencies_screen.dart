import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currencies_list_view.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/list_error.dart';

class SelectableCurrenciesScreen extends StatefulWidget {
  const SelectableCurrenciesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectableCurrenciesScreen> createState() =>
      SelectableCurrenciesScreenState();
}

class SelectableCurrenciesScreenState
    extends State<SelectableCurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Change currencies',
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
            return CurrenciesListView(onTap: _onTap);
          }
        },
      ),
    );
  }

  void _onTap(int id) => Navigator.pop(context, id);
}
