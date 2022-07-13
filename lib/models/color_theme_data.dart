import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  ThemeData _tealTheme = ThemeData(
    primaryColor: Colors.teal,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.teal),
    scaffoldBackgroundColor: Colors.teal,
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.white, fontFamily: 'Kaushan'),
      headline4: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),
  );
  ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(color: Colors.green),
    scaffoldBackgroundColor: Colors.green,
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.white, fontFamily: 'Kaushan'),
      headline4: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),
  );
  ThemeData _selectedTheme = ThemeData(
    primaryColor: Colors.teal,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.teal),
    scaffoldBackgroundColor: Colors.teal,
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.white, fontFamily: 'Kaushan'),
      headline4: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),
  );
  bool _isTeal = false;

  static var _sharedPref;

  bool get isTeal => _isTeal;
  ThemeData get selectedTheme => _isTeal ? _greenTheme : _tealTheme;

  void switchTheme(bool selected) {
    _isTeal = selected;
    saveThemeToSharePref(selected);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  } //This function take a copy of the data.

  void saveThemeToSharePref(bool value) {
    _sharedPref.setBool('themeData', value);
    print(_sharedPref.getBool('themeData'));
  } //This function save the data.

  void loadThemeFromSharedPref() {
    _isTeal = _sharedPref.getBool('themeData') ?? false;
  } //This function load the theme when app first running
}
