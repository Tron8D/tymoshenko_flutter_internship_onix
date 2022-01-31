import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/stream_builders/currency_list_stream_builder.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => CurrenciesScreenState();
}

class CurrenciesScreenState extends State<CurrenciesScreen> {
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
      body: CurrencyListStreamBuilder(
        onTap: _onTap,
      ),
    );
  }

  void _onTap(id) =>
      Navigator.of(context).pushNamed('/info_card_screen', arguments: id);
}
