import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/currencies_list_bloc/currencies_list_bloc.dart';

import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<ThemeBloc, ThemeState>(
        listenWhen: (context, state) {
          return state is ThemeFirstLoaded;
        },
        listener: (context, state) {
          Navigator.pushNamed(context, '/main');
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
