import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SwitchButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
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
