import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/data/models/local/currency.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
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
      body: BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
        builder: (context, state) {
          if (state is CurrenciesListError) {
            return ListError(
              error: state.errorMassage,
              onPressed: () => BlocProvider.of<CurrenciesListBloc>(context)
                  .add(GetCurrenciesList()),
            );
          } else if (state is CurrenciesListLoaded) {
            if (state.currencies.isEmpty) {
              return const Center(child: Text('List empty.'));
            } else {
              return CurrenciesListView(
                // onTap: () {},
                // onTap: (id) {
                //   // _onTap(context, id);
                // },
                currenciesList: state.currencies,
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // void _onTap(BuildContext context, int id) {
  //   // Currency currency = BlocProvider.of<CurrenciesListBloc>(context).getCurrencyFromId(emit, id);
  //   // Navigator.of(context).pushNamed('/info_card_screen', arguments: currency);
  // }
}
