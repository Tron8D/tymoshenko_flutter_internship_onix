import 'currency.dart';

class Wallet {
  double amount;
  Currency currency;

  Wallet({
    required this.amount,
    required this.currency,
  });

  //function of adding the amount to the wallet
  void addAmount(double amount) {
    if (amount > 0) {
      this.amount += amount;
    } else {
      print('The amount must be greater than 0');
    }
  }
}
