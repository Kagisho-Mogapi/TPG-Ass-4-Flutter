import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color btnColor = Colors.green;
String profileScheme = '';

class ProfileTheme with ChangeNotifier {
  String _pressedBtn = '';
  SharedPreferences? _preferences;

  String get pressedBtn => _pressedBtn;

  ProfileTheme() {
    _loadSettings();
  }

  _initializePrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _loadSettings() async {
    await _initializePrefs();
    _pressedBtn = _preferences?.getString('Pressed Btn') ?? 'Pic on left';
    _schemeChecker();
    notifyListeners();
  }

  _saveSettings() async {
    await _initializePrefs();
    _preferences?.setString('Pressed Btn', pressedBtn);
  }

  void onBtnPress(String id) {
    _pressedBtn = id;
    _schemeChecker();

    _saveSettings();
    notifyListeners();
  }

  _schemeChecker() {
    profileScheme = pressedBtn;
  }
}
