import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zepto_flutter_app/sharedprefs/zepto_shared_prefs_constants.dart';

@lazySingleton
class SharedPrefsHelper {
  Future<SharedPreferences?> getSharedPreferenceInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getToken() async {
    final prefs = await getSharedPreferenceInstance();
    String? token = prefs?.getString(authToken) ?? "";
    return token;
  }

  Future<bool> getRememberMeFlag() async {
    final prefs = await getSharedPreferenceInstance();
    bool flag = prefs?.getBool(rememberMeFlag) ?? false;
    print("flag-->$flag");
    return flag;
  }

  setRememberMeFlag(bool value) async {
    print("flag-->$value");
    final prefs = await getSharedPreferenceInstance();
    prefs?.setBool(rememberMeFlag, value);
  }
}
