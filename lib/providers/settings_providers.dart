import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/shared_preferance/prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProviders extends ChangeNotifier{
  String currentLocale ="en";
  ThemeMode currentMode =ThemeMode.light;

  void init() async{
   String? newLang = PrefsHelper.getLanguage();
   setCurrentLocale(newLang??"en");
   String mode =PrefsHelper.getMode();
   if(mode == "dark"){
     setCurrentMode(ThemeMode.dark);
   }else{
     setCurrentMode(ThemeMode.light);
   }
  }

  bool isDarkMode() => currentMode == ThemeMode.dark;
  void setCurrentLocale(String newLocale){
    currentLocale = newLocale ;
    PrefsHelper.setLanguage(newLocale);
    notifyListeners();
  }
  void setCurrentMode(ThemeMode newThemeMode){
    currentMode = newThemeMode;
    if(newThemeMode ==ThemeMode.dark){
      PrefsHelper.saveMode("dark");
    }else{
      PrefsHelper.saveMode("light");
    }
    notifyListeners();
  }
}