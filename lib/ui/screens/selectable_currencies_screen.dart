import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';

import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currencies_list_view.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/list_error.dart';
import 'package:flutter_intership_onix/utils/utils.dart';

class SelectableCurrenciesScreen extends StatelessWidget {
  final ListTileCallback onTap;

  const SelectableCurrenciesScreen({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CurrenciesListBloc>().add(GetCurrenciesList());

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
              onPressed: () =>
                  context.read<CurrenciesListBloc>().add(GetCurrenciesList()),
            );
          } else if (state is CurrenciesListLoaded) {
            if (state.currencies.isEmpty) {
              return const Center(child: Text('List empty.'));
            } else {
              return CurrenciesListView(
                onTap: onTap,
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
}
