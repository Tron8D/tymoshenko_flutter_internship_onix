import 'package:hive/hive.dart';

part 'currency_hive_model.g.dart';

@HiveType(typeId: 0)
class CurrencyHiveModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String symbol;

  @HiveField(4)
  final double rateToUah;

  @HiveField(5)
  final String countryCode;

  CurrencyHiveModel(
    this.id,
    this.name,
    this.fullName,
    this.symbol,
    this.rateToUah,
    this.countryCode,
  );
}
