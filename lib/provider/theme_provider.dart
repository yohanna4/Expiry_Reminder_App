import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    textTheme: const TextTheme(),
    buttonTheme: ButtonThemeData(buttonColor: Color.fromARGB(255, 75, 51, 79)),
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  static final lightTheme = ThemeData(
    appBarTheme:
        AppBarTheme(backgroundColor: Color.fromARGB(255, 124, 61, 200)),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    // textTheme: TextTheme(),

    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme:
        ButtonThemeData(buttonColor: Color.fromARGB(255, 182, 114, 246)),
  );
}
