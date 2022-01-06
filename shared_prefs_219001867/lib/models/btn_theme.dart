import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

BorderRadius roundBtn = BorderRadius.circular(18);

class Themes with ChangeNotifier {
  bool _isRoundBtns = false;
  SharedPreferences? _buttonPrefs;
  bool _doneLoading = false;

  bool get isRoundBtns => _isRoundBtns;
  bool get doneLoading => _doneLoading;

  set doneLoading(bool value) {
    _doneLoading = value;
    notifyListeners();
  }

  Themes() {
    _loadPrefs();
  }

  _initializePrefs() async {
    if (_buttonPrefs == null) {
      _buttonPrefs = await SharedPreferences.getInstance();
    }
  }

  _loadPrefs() async {
    await _initializePrefs();

    _isRoundBtns = _buttonPrefs?.getBool('button shape') ?? true;
    _btnShape();
    notifyListeners();
  }

  _savePrefs() async {
    await _initializePrefs();
    _buttonPrefs?.setBool('button shape', isRoundBtns);
  }

  void toggleBtnShape() {
    _isRoundBtns = !_isRoundBtns;
    _btnShape();

    _savePrefs();
    notifyListeners();
  }

  _btnShape() {
    if (_isRoundBtns) {
      roundBtn = BorderRadius.circular(18);
    } else if (!_isRoundBtns) {
      roundBtn = BorderRadius.vertical();
    }
  }
}
