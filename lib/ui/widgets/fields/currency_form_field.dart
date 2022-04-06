// import 'package:flutter/material.dart';
//
// import 'package:flutter_intership_onix/ui/providers/converter_provider.dart';
// import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
//
// class CurrencyFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final int indexTextFormField;
//   final double initialValue;
//   final String symbol;
//   final bool readOnly;
//
//   const CurrencyFormField({
//     Key? key,
//     required this.symbol,
//     required this.readOnly,
//     required this.initialValue,
//     required this.indexTextFormField,
//     required this.controller,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ConverterProvider>(
//       builder: (BuildContext context, ConverterProvider provider, _) {
//         provider.initialText(indexTextFormField);
//         int _topCardId = provider.converter.topCardId;
//         int _bottomCardId = provider.converter.bottomCardId;
//
//         provider.converter.topCardRate = context
//             .read<CurrenciesListProvider>()
//             .getCurrencyFromId(_topCardId)
//             .rateToUah;
//         provider.converter.bottomCardRate = context
//             .read<CurrenciesListProvider>()
//             .getCurrencyFromId(_bottomCardId)
//             .rateToUah;
//
//         return TextFormField(
//           controller: controller,
//           onChanged: (value) => context
//               .read<ConverterProvider>()
//               .textFieldOnChanged(indexTextFormField, value),
//           readOnly: readOnly,
//           keyboardType: TextInputType.number,
//           style: TextStyle(
//               fontSize: 35, color: Theme.of(context).secondaryHeaderColor),
//           decoration: InputDecoration(
//             suffixText: symbol,
//             suffixStyle: TextStyle(
//                 fontSize: 20,
//                 color: Theme.of(context).secondaryHeaderColor,
//                 textBaseline: TextBaseline.alphabetic),
//           ),
//         );
//       },
//     );
//   }
// }
