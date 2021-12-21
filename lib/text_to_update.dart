import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextToUpdate extends StatefulWidget {
  String _textToUpdate = 'Waiting update.';
  TextToUpdate({Key? key }) : super(key: key);

  @override
  TextToUpdateState createState() => TextToUpdateState();
}

class TextToUpdateState extends State<TextToUpdate> {
  //Update text in widget.
  void updateText(String newText) {
    setState(() {
      widget._textToUpdate = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget._textToUpdate);
  }

}
