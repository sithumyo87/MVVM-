
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;
   ThemeData _defaultTheme =  ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      );

  ThemeData get theme => _defaultTheme; 
  bool get isDark => _isDark;

  void setDarkTheme(){
     _isDark = true;
      _defaultTheme =  ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ); 
      notifyListeners();
  }

  void setLightTheme(){
     _isDark = false;
      _defaultTheme =  ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      );
      notifyListeners();
  }
}
