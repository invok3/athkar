import 'package:athkar_app/main.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  int frequency = 2;
  bool vibrateOnTap = false;
  bool soundOnTap = false;

  SettingsProvider() {
    _loadSettings();
  }

  setFrequency(int loadedFrequency) {
    frequency = loadedFrequency;
    sharedPreferences?.setInt("frequency", loadedFrequency);
    notifyListeners();
  }

  _loadSettings() async {
    int loadedFrequency = sharedPreferences?.getInt("frequency") ?? 2;
    bool loadedVibrateOnTap =
        sharedPreferences?.getBool("vibrateOnTap") ?? false;
    bool loadedSoundOnTap = sharedPreferences?.getBool("soundOnTap") ?? false;
    setFrequency(loadedFrequency);
    setVibrateOnTap(loadedVibrateOnTap);
    setSoundOnTap(loadedSoundOnTap);
  }

  void setVibrateOnTap(bool loadedVibrateOnTap) {
    vibrateOnTap = loadedVibrateOnTap;
    sharedPreferences?.setBool("vibrateOnTap", loadedVibrateOnTap);
    notifyListeners();
  }

  void setSoundOnTap(bool loadedSoundOnTap) {
    soundOnTap = loadedSoundOnTap;
    sharedPreferences?.setBool("soundOnTap", loadedSoundOnTap);
    notifyListeners();
  }
}
