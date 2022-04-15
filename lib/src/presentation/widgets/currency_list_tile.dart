import 'package:flutter/material.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';
import 'package:flutter_intership_onix/src/utils/utils.dart';

class CurrencyListTile extends StatelessWidget {
  final Currency currency;
  final ListTileCallback onTap;

  const CurrencyListTile({
    Key? key,
    required this.currency,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 7),
            blurRadius: 7,
          )
        ], borderRadius: BorderRadius.all(Radius.circular(5))),
        child: _getImage(currency.countryCode),
      ),
      title: Text(
        currency.name,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).secondaryHeaderColor),
      ),
      subtitle: Text(
        currency.fullName,
        style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      ),
      trailing: IconButton(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        onPressed: () => onTap(currency.id),
      ),
    );
  }

  Widget _getImage(String countryCode) {
    if (countryCode == 'btc') {
      return Image.network(
        'https://mundotokens.com/wp-content/uploads/2018/01/bitcoin_.jpg',
        width: 80,
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
        width: 80,
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
