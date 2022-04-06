// import 'package:flutter/material.dart';
//
// import 'package:flutter_intership_onix/data/models/local/currency.dart';
// import 'package:flutter_intership_onix/ui/providers/converter_provider.dart';
// import 'package:flutter_intership_onix/ui/providers/currencies_list_provider.dart';
// import 'package:flutter_intership_onix/ui/screens/selectable_currencies_screen.dart';
// import 'package:flutter_intership_onix/ui/widgets/currency_list_tile.dart';
// import 'package:flutter_intership_onix/ui/widgets/fields/currency_form_field.dart';
//
// class CurrencyCard extends StatelessWidget {
//   final int cardIndex;
//   final Currency currency;
//   final bool readOnly;
//
//   const CurrencyCard({
//     Key? key,
//     required this.currency,
//     required this.readOnly,
//     required this.cardIndex,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         elevation: 20,
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           height: 200,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CurrencyListTile(
//                 onTap: (_) => _onTap(context),
//                 currency: currency,
//               ),
//               CurrencyFormField(
//                 indexTextFormField: cardIndex,
//                 controller: _selectController(context),
//                 initialValue: _selectInitialValue(context),
//                 readOnly: readOnly,
//                 symbol: currency.symbol,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _onTap(BuildContext context) async {
//     if (cardIndex == 0 && result != null) {
//       context.read<ConverterProvider>().converter.topCardRate = context
//           .read<CurrenciesListProvider>()
//           .getCurrencyFromId(result)
//           .rateToUah;
//
//       context.read<ConverterProvider>().setTopCard(result);
//     } else if (result != null) {
//       context.read<ConverterProvider>().converter.bottomCardRate = context
//           .read<CurrenciesListProvider>()
//           .getCurrencyFromId(result)
//           .rateToUah;
//
//       context.read<ConverterProvider>().setBottomCard(result);
//     }
//   }
//
//   double _selectInitialValue(BuildContext context) {
//     if (cardIndex == 0) {
//       return context.watch<ConverterProvider>().converter.inputValue;
//     } else {
//       return context.watch<ConverterProvider>().converter.convertedValue;
//     }
//   }
//
//   TextEditingController _selectController(BuildContext context) {
//     if (cardIndex == 0) {
//       return context.watch<ConverterProvider>().topCardController;
//     } else {
//       return context.watch<ConverterProvider>().bottomCardController;
//     }
//   }
// }
