import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_intership_onix/src/presentation/screens/currencies/bloc/currencies_list_bloc.dart';

class CurrencyInfoScreen extends StatelessWidget {
  const CurrencyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Currency info',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 300,
          child: BlocBuilder<CurrenciesListBloc, CurrenciesListState>(
            builder: (context, state) {
              if (state is CurrenciesListLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 7),
                            blurRadius: 7,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: _getImage(state.currencyFromId.countryCode),
                    ),
                    Text(state.currencyFromId.name),
                    Text(state.currencyFromId.fullName),
                    Text(state.currencyFromId.symbol),
                    Text(
                        'Rate : ${state.currencyFromId.rateToUah.toString()} UAH'),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _getImage(String countryCode) {
    if (countryCode == 'btc') {
      return Image.network(
        'https://mundotokens.com/wp-content/uploads/2018/01/bitcoin_.jpg',
        width: 200,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.image,
            size: 35,
            color: Theme.of(context).secondaryHeaderColor,
          );
        },
      );
    } else {
      return Image.network(
        'https://flagcdn.com/w80/' + countryCode + '.png',
        scale: 0.5,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.image,
            size: 35,
            color: Theme.of(context).secondaryHeaderColor,
          );
        },
      );
    }
  }
}
