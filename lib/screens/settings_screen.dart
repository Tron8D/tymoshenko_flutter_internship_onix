import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/main.dart';

class SettingsScreen extends StatefulWidget {
  bool darkTheme = userSettings.light;
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              setState(() {
                Navigator.pop(context, widget.darkTheme);
              });
            },
          ),
        ],
      ),
      body: Center(
        child: CheckboxListTile(
          title: Text("Dark theme"),
          value: widget.darkTheme,
          onChanged: (value) {
            setState(() {
              print("!!!");
              widget.darkTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
