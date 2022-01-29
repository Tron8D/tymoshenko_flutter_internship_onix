import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/ui/widgets/buttons/settings_button.dart';
import 'package:flutter_intership_onix/ui/widgets/stream_builders/currency_card_stream_builder.dart';

import '/data/source/currencies.dart';
import '../../main.dart';
import '../widgets/buttons/converter_button.dart';
import '../widgets/buttons/switch_button.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Converter',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
        actions: const [
          SettingsButton(),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CurrencyCardStreamBuilder(
            stream: userSettings.streams.topCardStream,
            readOnly: false,
            // onTap: ,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ConverterButton(),
              SwitchButton(),
            ],
          ),
          const SizedBox(height: 5),
          CurrencyCardStreamBuilder(
            stream: userSettings.streams.bottomCardStream,
            readOnly: true,
          ),
        ],
      ),
    );
  }
}