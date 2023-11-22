import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs ;

  static String? getLanguage(){
    return prefs.getString("newLocale");
  }
  static setLanguage(String newLocale) async{
    await prefs.setString("newLocale", newLocale);
  }
  static saveMode(String mode) async{
    await prefs.setString("newMode", mode);
}
  static String getMode(){
    return prefs.getString("newMode")??"ligth";
  }
}