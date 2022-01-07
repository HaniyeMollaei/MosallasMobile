import 'package:flutter/cupertino.dart';

class BottomSheetListviewProvider extends ChangeNotifier{

  String _choosedValue;
  int _choosedValueIndex;

  String get choosedValue => _choosedValue;

  setChoosedValue(String value) {
    _choosedValue = value;
    notifyListeners();
  }

  int get choosedValueIndex => _choosedValueIndex;

  setChoosedValueIndex(int value) {
    _choosedValueIndex = value;
    notifyListeners();
  }
}