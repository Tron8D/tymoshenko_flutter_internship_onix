import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/fields/currency_form_field.dart';
import 'package:flutter_intership_onix/tiles/currency_list_tile.dart';

class CurrencyCard extends StatelessWidget {
  final Currency currency;

  const CurrencyCard({Key? key, required this.currency}) : super(key: key);

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
              CurrencyListTile(currency: currency),
              CurrencyFormField(symbol: currency.symbol),
            ],
          ),
        ),
      ),
    );
  }
}
