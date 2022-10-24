

import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier{
  
  bool _isMya = false;
  
  Locale _locale = Locale('en', '');

  Locale get locale => _locale;
  bool get isMya => _isMya;

  void setMyanmar(){
    _locale = Locale('my', '');
    _isMya = true;
    notifyListeners();
  }
  

  void setEnglish(){
    _locale = Locale('en', '');
    _isMya = false;
    notifyListeners();
  } 
}