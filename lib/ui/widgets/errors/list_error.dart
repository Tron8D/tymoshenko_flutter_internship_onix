import 'package:flutter/material.dart';

//Show this widget when has error
class ListError extends StatelessWidget {
  final String error;
  final VoidCallback onPressed;

  const ListError({Key? key, required this.error, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Error: $error}")),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text(
            'Try again.',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).secondaryHeaderColor),
          ),
        ),
      ],
    );
  }
}
