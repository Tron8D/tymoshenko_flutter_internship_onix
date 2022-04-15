import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_intership_onix/src/data/model/data/data_response.dart';
import 'package:flutter_intership_onix/src/domain/entity/currency.dart';

abstract class CurrenciesDioSource {
  @protected
  final dio = Dio();

  Future<DataResponse<List<Currency>>> getCurrencies();
}
