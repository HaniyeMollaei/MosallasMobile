import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddNewProductProvider extends ChangeNotifier {
  bool _hasOnlineSell = false ;
  bool _hasPhysicalSell = false ;
  XFile _image;


  bool get hasOnlineSell => _hasOnlineSell;

  setHasOnlineSell(bool value) {
    _hasOnlineSell = value;
    notifyListeners();
  }

  bool get hasPhysicalSell => _hasPhysicalSell;

  setHasPhysicalSell(bool value) {
    _hasPhysicalSell = value;
    notifyListeners();
  }

  XFile get image => _image;

  setImage(XFile value) {
    _image = value;
    notifyListeners();
  }
}