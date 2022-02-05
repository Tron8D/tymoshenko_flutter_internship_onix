// import 'package:flutter/material.dart';
//
// import 'package:flutter_intership_onix/data/models/currency.dart';
// import 'package:flutter_intership_onix/main.dart';
// import 'package:flutter_intership_onix/ui/widgets/currency_card.dart';
//
// class CurrencyCardStreamBuilder extends StatelessWidget {
//   final int cardIndex;
//   //TODO: create enum
//   final Stream<int> stream;
//   final bool readOnly;
//
//   const CurrencyCardStreamBuilder({
//     Key? key,
//     required this.stream,
//     required this.readOnly,
//     required this.cardIndex,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     late int defaultCurrencyId;
//     Currency currency;
//     return StreamBuilder<int>(
//         stream: stream,
//         builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//           if (snapshot.hasData) {
//             currency = currenciesRepository.getCurrencyFromId(snapshot.data!);
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text('Card error'),
//             );
//           } else {
//             if (cardIndex == 0) {
//               defaultCurrencyId = userSettings.converter.topCardId;
//             } else {
//               defaultCurrencyId = userSettings.converter.bottomCardId;
//             }
//
//             currency =
//                 currenciesRepository.getCurrencyFromId(defaultCurrencyId);
//           }
//           return CurrencyCard(
//             cardIndex: cardIndex,
//             readOnly: readOnly,
//             currency: currency,
//           );
//         });
//   }
// }
