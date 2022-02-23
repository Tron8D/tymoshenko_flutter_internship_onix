import 'package:json_annotation/json_annotation.dart';

part 'currencies_source_response.g.dart';

@JsonSerializable()
class CurrencySourceResponse {
  @JsonKey()
  final String ccy;

  @JsonKey(name: 'base_ccy')
  final String baseCcy;

  @JsonKey()
  final String buy;

  @JsonKey()
  final String sale;

  CurrencySourceResponse(this.ccy, this.baseCcy, this.buy, this.sale);

  factory CurrencySourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencySourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencySourceResponseToJson(this);
}
