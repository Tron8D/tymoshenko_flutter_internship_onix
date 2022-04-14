import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/auth_bloc/auth_bloc.dart';

import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';

import '../widgets/buttons/outlined_custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> items = ['15 sec', '30 sec', '1 min'];
  late String value =
      context.read<CurrenciesListBloc>().updateInterval ?? items.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: _onSave,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if (state is ThemeLoaded) {
                  return CheckboxListTile(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    title: const Text('Dark theme'),
                    value: state.isDark,
                    onChanged: (_) {
                      context.read<ThemeBloc>().add(ChangeTheme());
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
              builder: (context, state) {
                if (state is CurrenciesListLoaded) {
                  return ListTile(
                    title: const Text('Update interval: '),
                    trailing: DropdownButton<String>(
                        value: state.updateInterval ?? items.first,
                        items: items.map(_menuItem).toList(),
                        onChanged: (newValue) {
                          context.read<CurrenciesListBloc>().add(
                              SetUpdateInterval(
                                  updateInterval: newValue ?? items.first));
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            OutlinedCustomButton(
              title: 'Sign out',
              onPressed: () {
                context.read<AuthBloc>().add(SignOut());
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _menuItem(String item) =>
      DropdownMenuItem<String>(value: item, child: Text(item));

  void _onSave() => Navigator.pop(context);
}
