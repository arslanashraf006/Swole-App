import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swole_app/core/shared_prefrences/shared_prefs.dart';

final locator=GetIt.I;

Future<void> setupLocator() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(GetIt.I.get<SharedPreferences>()));
}