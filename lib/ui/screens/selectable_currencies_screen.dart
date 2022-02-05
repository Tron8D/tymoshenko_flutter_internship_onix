import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/stream_builders/currencies_list_view.dart';

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
      body: CurrenciesListView(
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int id) => Navigator.pop(context, id);
}
