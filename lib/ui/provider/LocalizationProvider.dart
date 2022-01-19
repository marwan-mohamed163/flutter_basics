import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier{
  String locale ='ar';

  void changeLocale(String newLocale){
    if(newLocale==locale)return;
    locale = newLocale;
    notifyListeners();
  }
}