import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/src/presentation/bloc/language/language_cubit.dart';
import 'package:flutter_intership_onix/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/model/time_interval.dart';
import 'package:flutter_intership_onix/src/presentation/model/language.dart';
import 'package:flutter_intership_onix/src/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/screens/currencies/bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/src/presentation/widgets/buttons/outlined_custom_button.dart';
import 'package:flutter_intership_onix/src/utils/localization/localization.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<TimeInterval> intervals = [];
  List<Language> languages = [];

  @override
  void initState() {
    languages = const <Language>[
      Language(languageCode: 'en', name: 'English'),
      Language(languageCode: 'uk', name: 'Українська'),
      Language(languageCode: 'de', name: 'German'),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    intervals = <TimeInterval>[
      TimeInterval(name: lang(context).interval0, intervalCode: '15 sec'),
      TimeInterval(name: lang(context).interval1, intervalCode: '30 sec'),
      TimeInterval(name: lang(context).interval2, intervalCode: '1 min'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          lang(context).settingsScreenTitle,
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
                    title: Text(lang(context).themeTile),
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
                    title: Text(lang(context).intervalTile),
                    trailing: DropdownButton<TimeInterval>(
                        value: intervals.firstWhere((element) =>
                            state.updateInterval == element.intervalCode),
                        items: intervals.map(_menuIntervalItem).toList(),
                        onChanged: (newValue) {
                          context.read<CurrenciesListBloc>().add(
                              SetUpdateInterval(
                                  updateInterval: newValue!.intervalCode));
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return ListTile(
                  title: Text(lang(context).selectLanguage),
                  trailing: DropdownButton<Language>(
                      value: languages.firstWhere((element) =>
                          state.languageCode == element.languageCode),
                      items: languages.map(_menuLanguageItem).toList(),
                      onChanged: (newLanguage) {
                        _changeLanguage(newLanguage!.languageCode);
                      }),
                );
              },
            ),
            OutlinedCustomButton(
              title: lang(context).signOutButton,
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

  DropdownMenuItem<TimeInterval> _menuIntervalItem(TimeInterval intervalItem) =>
      DropdownMenuItem<TimeInterval>(
          value: intervalItem, child: Text(intervalItem.name));

  DropdownMenuItem<Language> _menuLanguageItem(Language languageItem) =>
      DropdownMenuItem<Language>(
          value: languageItem, child: Text(languageItem.name));

  void _onSave() => Navigator.pop(context);

  void _changeLanguage(String selectLanguage) {
    return context.read<LanguageCubit>().changeLanguage(selectLanguage);
  }
}
