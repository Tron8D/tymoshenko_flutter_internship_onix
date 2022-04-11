import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/converter_bloc/converter_bloc.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<ConverterBloc>().add(SwitchCards());
      },
      child: const Text(
        'Switch currencies',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
      ),
    );
  }
}
