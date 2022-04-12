import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  int frequency = 2;
  SettingsProvider() {}

  setFrequency(int i) {
    frequency = i;
    notifyListeners();
  }
}
