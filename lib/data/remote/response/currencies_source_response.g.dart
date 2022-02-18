// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_source_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencySourceResponse _$CurrencySourceResponseFromJson(
        Map<String, dynamic> json) =>
    CurrencySourceResponse(
      json['ccy'] as String,
      json['base_ccy'] as String,
      json['buy'] as String,
      json['sale'] as String,
    );

Map<String, dynamic> _$CurrencySourceResponseToJson(
        CurrencySourceResponse instance) =>
    <String, dynamic>{
      'ccy': instance.ccy,
      'base_ccy': instance.baseCcy,
      'buy': instance.buy,
      'sale': instance.sale,
    };
