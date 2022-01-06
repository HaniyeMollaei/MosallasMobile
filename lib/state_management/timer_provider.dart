import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  bool _hasTimerStopped = false;
  int _time = 120;
  bool _resendCode = false;
  bool _passPressed = false;
  bool _isDisable = true;

  bool get hasTimerStopped => _hasTimerStopped;

  setHasTimerStopped(bool value) {
    _hasTimerStopped = value;
    notifyListeners();
  }

  int get time => _time;

  setTime(int value) {
    _time = value;
    notifyListeners();
  }

  bool get resendCode => _resendCode;

  setResendCode(bool value) {
    _resendCode = value;
    notifyListeners();
  }

  bool get passPressed => _passPressed;

  setPassPressed(bool value) {
    _passPressed = value;
    notifyListeners();
  }

  bool get isDisable => _isDisable;

  setIsDisable(bool value) {
    _isDisable = value;
    notifyListeners();
  }
}