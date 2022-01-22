import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class BannerProvider with ChangeNotifier{
  XFile _image;
  Uint8List _uploadedImage;

  XFile get image => _image;

  setImage(XFile value) {
    _image = value;
    notifyListeners();
  }

  Uint8List get uploadedImage => _uploadedImage;

  setUploadedImage(Uint8List value) {
    _uploadedImage = value;
    notifyListeners();
  }
}