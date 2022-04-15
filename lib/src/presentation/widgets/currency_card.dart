import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/presentation/screens/converter/bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/selectable_currencies/selectable_currencies_screen.dart';
import 'package:flutter_intership_onix/src/presentation/widgets/currency_list_tile.dart';
import 'package:flutter_intership_onix/src/presentation/widgets/fields/currency_form_field.dart';

class CurrencyCard extends StatelessWidget {
  final int cardIndex;
  final Currency currency;
  final TextEditingController controller;
  final bool readOnly;

  const CurrencyCard({
    Key? key,
    required this.currency,
    required this.readOnly,
    required this.cardIndex,
    required this.controller,
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
                onTap: (_) => _pushScreenOnTap(context),
                currency: currency,
              ),
              CurrencyFormField(
                indexTextFormField: cardIndex,
                controller: controller,
                readOnly: readOnly,
                symbol: currency.symbol,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //push screen for select card
  void _pushScreenOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectableCurrenciesScreen(
            onTap: (id) => _setCardOnTap(context, id)),
      ),
    );
  }

  //send event to  bloc for set card
  void _setCardOnTap(BuildContext context, int id) {
    context.read<ConverterBloc>().add(SetCardId(cardIndex: cardIndex, id: id));
    Navigator.pop(context, id);
  }
}
