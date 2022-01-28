import 'package:flutter/material.dart';

import '/data/models/currency.dart';
import 'currency_list_tile.dart';
import 'fields/currency_form_field.dart';

class CurrencyCard extends StatelessWidget {
  Currency currency;
  final bool readOnly;
  // final void Function() onTap;

  CurrencyCard({
    Key? key,
    required this.currency,
    required this.readOnly,
    // required this.onTap,
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
                // onTap: onTap,
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
}
