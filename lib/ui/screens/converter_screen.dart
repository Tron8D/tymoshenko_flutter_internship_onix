import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/switch_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currency_card.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/card_error.dart';
import 'package:flutter_intership_onix/data/models/local/converter.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Converter',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: const [SettingsButton()],
      ),
      body: BlocBuilder<ConverterBloc, ConverterState>(
        builder: (context, converterState) {
          if (converterState is ConverterLoaded) {
            return ListView(children: [
              _showCards(0, converterState.converter,
                  converterState.topCardController),
              const SizedBox(height: 5),
              const Center(child: SwitchButton()),
              const SizedBox(height: 5),
              _showCards(1, converterState.converter,
                  converterState.bottomCardController),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  //widget for build cards
  Widget _showCards(
    int cardIndex,
    Converter converter,
    TextEditingController controller,
  ) {
    return BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
      builder: (context, currenciesListState) {
        if (currenciesListState is CurrenciesListError) {
          String _error = currenciesListState.errorMassage;

          return CardError(
            error: _error,
            onTap: () =>
                context.read<CurrenciesListBloc>().add(GetCurrenciesList()),
          );
        } else if (currenciesListState is CurrenciesListLoaded) {
          Currency currency = cardIndex == 0
              ? currenciesListState.currencies[converter.topCardId]
              : currenciesListState.currencies[converter.bottomCardId];

          if (cardIndex == 0 && converter.topCardRate != currency.rateToUah) {
            context.read<ConverterBloc>().add(SetRates(
                  cardIndex: cardIndex,
                  rate: currency.rateToUah,
                ));
          } else if (cardIndex == 1 &&
              converter.bottomCardRate != currency.rateToUah) {
            context.read<ConverterBloc>().add(SetRates(
                  cardIndex: cardIndex,
                  rate: currency.rateToUah,
                ));
          }
          return CurrencyCard(
            cardIndex: cardIndex,
            readOnly: cardIndex == 0 ? false : true,
            controller: controller,
            currency: currency,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
