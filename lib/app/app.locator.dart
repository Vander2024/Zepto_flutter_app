// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';

import '../api/api.dart';
import '../api/api_helper.dart';
import '../sharedprefs/shared_pref_helper.dart';

final zeptoLocator = StackedLocator.instance;

Future<void> setUpZeptoLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  zeptoLocator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  zeptoLocator.registerLazySingleton(() => NavigationService());
  zeptoLocator.registerLazySingleton(() => DialogService());
  zeptoLocator.registerLazySingleton(() => SharedPrefsHelper());
  zeptoLocator.registerLazySingleton(() => API());
  zeptoLocator.registerLazySingleton(() => ApiHelper());
}
