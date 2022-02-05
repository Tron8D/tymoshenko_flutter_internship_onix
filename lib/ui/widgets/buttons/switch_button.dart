import 'package:flutter/material.dart';

import 'package:flutter_intership_onix/ui/providers/converter_provider.dart';
import 'package:provider/provider.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.read<ConverterProvider>().switchCard();
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
