import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;
  //Typography defaultTypography;
  SharedPreferences prefs;
  //ThemeData dark = ThemeData.dark().copyWith();
  ThemeData light = ThemeData.light().copyWith();

  ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(240, 0, 0, 0),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    ),
    //primaryColorDark: Colors.black87,
    cardColor: Color.fromARGB(240, 10, 10, 10), //   <------
    scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
    primaryColor: Colors.black87,
    brightness: Brightness.dark,
    highlightColor: Colors.white,
    backgroundColor: Colors.black54,
    textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.grey),
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkTheme;
  }

  /*Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == darkTheme) {
      _selectedTheme = darkTheme;
      await prefs.setBool("darkTheme", true);
      //_selectedTheme = lightTheme;
      //await prefs.setBool("darkTheme", false);
    } else {
      //_selectedTheme = darkTheme;
      //await prefs.setBool("darkTheme", true);

      _selectedTheme = lightTheme;
      await prefs.setBool("darkTheme", false);
    }

    notifyListeners();
  }*/

  ThemeData getTheme() => _selectedTheme;
}
