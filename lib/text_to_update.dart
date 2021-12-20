import 'package:flutter/material.dart';

class TextToUpdate extends StatefulWidget {
  TextToUpdate({Key? key}) : super(key: key);

  @override
  TextToUpdateState createState() => TextToUpdateState();
}

class TextToUpdateState extends State<TextToUpdate> {
  String textToUpdate = 'Waiting update';

  void updateText(String newText) {
    textToUpdate = newText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(textToUpdate);
  }
}
