import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/main.dart';
import 'package:flutter_intership_onix/ui/screens/selectable_currencies_screen.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_list_tile.dart';
import 'package:flutter_intership_onix/ui/widgets/fields/currency_form_field.dart';

class CurrencyCard extends StatelessWidget {
  final int cardIndex;
  final Currency currency;
  final bool readOnly;

  const CurrencyCard({
    Key? key,
    required this.currency,
    required this.readOnly,
    required this.cardIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyListTile(
                onTap: (_) => _onTap(context),
                currency: currency,
              ),
              CurrencyFormField(
                readOnly: readOnly,
                symbol: currency.symbol,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    int result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectableCurrenciesScreen(),
      ),
    );

    if (cardIndex == 0) {
      userSettings.setTopCard(result);
    } else {
      userSettings.setBottomCard(result);
    }
  }
}
