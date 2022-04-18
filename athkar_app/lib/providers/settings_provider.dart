import 'package:athkar_app/main.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  int frequency = 2;
  SettingsProvider() {
    _loadSettings();
  }

  setFrequency(int i) {
    frequency = i;
    sharedPreferences?.setInt("frequency", i);
    notifyListeners();
  }

  _loadSettings() async {
    int loadedFrequency = sharedPreferences?.getInt("frequency") ?? 2;
    setFrequency(loadedFrequency);
  }
}
