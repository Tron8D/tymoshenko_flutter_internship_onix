import 'package:flutter_intership_onix/src/domain/use_case/clear_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_update_interval_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/set_update_interval_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_intership_onix/src/data/repository/currencies_repository_impl.dart';
import 'package:flutter_intership_onix/src/data/source/local/currency_hive_source.dart';
import 'package:flutter_intership_onix/src/data/source/local/impl/currency_hive_source_impl.dart';
import 'package:flutter_intership_onix/src/data/source/local/impl/preferences_management_impl.dart';
import 'package:flutter_intership_onix/src/data/source/local/preferences_management.dart';
import 'package:flutter_intership_onix/src/data/source/remote/currencies_dio_source.dart';
import 'package:flutter_intership_onix/src/data/source/remote/impl/currencies_dio_source_impl.dart';
import 'package:flutter_intership_onix/src/data/source/remote/impl/preferences_database_impl.dart';
import 'package:flutter_intership_onix/src/data/source/remote/preferences_database.dart';
import 'package:flutter_intership_onix/src/domain/repository/currencies_repository.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_currencies_list_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/get_update_time_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/currencies_list/set_update_time_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/theme/get_theme_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/theme/set_theme_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/add_user_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/get_user_preferences_use_case.dart';
import 'package:flutter_intership_onix/src/domain/use_case/user_preferences/update_user_preferences_use_case.dart';

GetIt getIt = GetIt.I;

void setUpServiceLocator() {
  getIt.registerSingleton<CurrenciesDioSource>(CurrenciesDioSourceImpl());
  getIt.registerSingleton<CurrenciesHiveSource>(CurrenciesHiveSourceImpl());
  getIt.registerSingleton<PreferencesManagement>(PreferencesManagementImpl());
  getIt.registerSingleton<PreferencesDatabase>(PreferencesDatabaseImpl());

  getIt.registerLazySingleton<CurrenciesRepository>(
      () => CurrenciesRepositoryImpl(
            currenciesDioSource: getIt<CurrenciesDioSource>(),
            currenciesHiveSource: getIt<CurrenciesHiveSource>(),
          ));

  getIt.registerLazySingleton<GetCurrenciesListUseCase>(
      () => GetCurrenciesListUseCase(getIt<CurrenciesRepository>()));
  getIt.registerLazySingleton<GetUpdateTimeUseCase>(
      () => GetUpdateTimeUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<GetUpdateIntervalUseCase>(
      () => GetUpdateIntervalUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<SetUpdateTimeUseCase>(
      () => SetUpdateTimeUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<SetUpdateIntervalUseCase>(
      () => SetUpdateIntervalUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<SetThemeUseCase>(
      () => SetThemeUseCase(getIt<PreferencesManagement>()));
  getIt.registerLazySingleton<AddUserPreferencesUseCase>(
      () => AddUserPreferencesUseCase(getIt<PreferencesDatabase>()));
  getIt.registerLazySingleton<GetUserPreferencesUseCase>(
      () => GetUserPreferencesUseCase(getIt<PreferencesDatabase>()));
  getIt.registerLazySingleton<UpdateUserPreferencesUseCase>(
      () => UpdateUserPreferencesUseCase(getIt<PreferencesDatabase>()));
  getIt.registerLazySingleton<ClearPreferencesUseCase>(
      () => ClearPreferencesUseCase(getIt<PreferencesManagement>()));
}
