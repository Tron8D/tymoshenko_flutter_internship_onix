import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/src/presentation/screens/converter/bloc/converter_bloc.dart';

class CurrencyFormField extends StatelessWidget {
  final String symbol;
  final bool readOnly;
  final int indexTextFormField;
  final TextEditingController controller;

  const CurrencyFormField({
    Key? key,
    required this.symbol,
    required this.readOnly,
    required this.indexTextFormField,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => context.read<ConverterBloc>().add(ChangeFormField(
            indexTextFormField: indexTextFormField,
            value: value,
          )),
      readOnly: readOnly,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: 35, color: Theme.of(context).secondaryHeaderColor),
      decoration: InputDecoration(
        suffixText: symbol,
        suffixStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).secondaryHeaderColor,
            textBaseline: TextBaseline.alphabetic),
      ),
    );
  }
}
