import 'dart:typed_data';

class BannerModel{
  String descriptionForAdmin;
  String createDate;
  String showDate;
  String status;
  //Uint8List image ;
  String image;
  int bannerCost;
  BannerModel({this.descriptionForAdmin, this.createDate, this.showDate, this.status, this.image, this.bannerCost});

}