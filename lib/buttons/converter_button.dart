import 'package:flutter/material.dart';

class ConverterButton extends StatelessWidget {
  const ConverterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).secondaryHeaderColor,
      onTap: () {},
      child: Ink(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              color: Colors.black38,
            ),
          ],
        ),
        child: Icon(
          Icons.drag_handle,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }
}
