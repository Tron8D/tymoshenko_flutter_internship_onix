import 'package:flutter/material.dart';

class OutlinedCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const OutlinedCustomButton(
      {required this.title, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
      ),
    );
  }
}
