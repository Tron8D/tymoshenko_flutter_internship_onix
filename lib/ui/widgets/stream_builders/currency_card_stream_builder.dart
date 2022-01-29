import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/data/models/currency.dart';
import 'package:flutter_intership_onix/main.dart';

import '../currency_card.dart';

class CurrencyCardStreamBuilder extends StatelessWidget {
  final Stream<int> stream;
  final bool readOnly;
  const CurrencyCardStreamBuilder({
    Key? key,
    required this.stream,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          Currency currency =
              currenciesRepository.getCurrencyFromId(snapshot.data ?? 0);
          if (snapshot.hasData) {
            return CurrencyCard(readOnly: readOnly, currency: currency);
          }
          return const CircularProgressIndicator();
        });
  }
}
