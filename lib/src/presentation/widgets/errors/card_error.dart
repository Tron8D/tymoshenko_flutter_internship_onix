import 'package:flutter/material.dart';

//Show this card when has error
class CardError extends StatelessWidget {
  final String error;
  final VoidCallback onTap;

  const CardError({Key? key, required this.error, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 20,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            child: Center(child: Text(error)),
          ),
        ),
      ),
    );
  }
}
