import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  final SharedPreferences sharedPref;
  SharedPreferenceHelper(this.sharedPref);

  static const String accessTokenKey='access_token';
  static const String refreshTokenKey='refresh_token';

   Future saveAuthToken(String value) async{
    return sharedPref.setString(accessTokenKey, value);
  }
   Future getAuthToken() async{
    return sharedPref.getString(accessTokenKey);
  }
   Future saveRefreshToken(String value) async{
    return sharedPref.setString(refreshTokenKey, value);
  }
   Future getRefreshToken() async{
    return sharedPref.getString(refreshTokenKey);
  }
}