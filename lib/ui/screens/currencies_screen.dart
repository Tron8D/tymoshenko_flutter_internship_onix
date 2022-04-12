import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/currencies_list_view.dart';
import 'package:flutter_intership_onix/ui/widgets/errors/list_error.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationSettingsBtnController;
  late Animation<double> _animationRotateButton;

  @override
  void initState() {
    _animationSettingsBtnController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationRotateButton = CurvedAnimation(
        parent: _animationSettingsBtnController, curve: Curves.easeInOutCirc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<CurrenciesListBloc>().add(GetCurrenciesList());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Currencies',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: [
          RotationTransition(
            turns: _animationRotateButton,
            child: SettingsButton(
              animationController: _animationSettingsBtnController,
            ),
          )
        ],
      ),
      body: BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
        builder: (context, state) {
          if (state is CurrenciesListError) {
            return ListError(
                error: state.errorMassage,
                onPressed: () => context
                    .read<CurrenciesListBloc>()
                    .add(GetCurrenciesList()));
          } else if (state is CurrenciesListLoaded) {
            if (state.currencies.isEmpty) {
              return const Center(child: Text('List empty.'));
            } else {
              return CurrenciesListView(
                  onTap: (id) {
                    _onTap(context, id);
                  },
                  currenciesList: state.currencies);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _onTap(BuildContext context, int id) {
    context.read<CurrenciesListBloc>().add(GetCurrencyForInfo(id: id));
    Navigator.of(context).pushNamed('/info_card_screen');
  }
}
