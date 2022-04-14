import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';

import '../bloc/converter_bloc/converter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<CurrenciesListBloc>().clearPref();
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<ThemeBloc, ThemeState>(
        listenWhen: (context, state) {
          return state is ThemeFirstLoaded;
        },
        listener: (context, state) {
          User? _currentUser = FirebaseAuth.instance.currentUser;

          if (_currentUser == null) {
            Navigator.pushReplacementNamed(context, '/auth');
          } else {
            context
                .read<ConverterBloc>()
                .add(ConverterLoadPref(uid: _currentUser.uid));
            Navigator.pushReplacementNamed(context, '/main');
          }
          context.read<ThemeBloc>().add(ThemePrefLoaded());
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
