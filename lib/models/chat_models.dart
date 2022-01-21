import 'package:mosallas/models/shop_vitrine_model.dart';

class BuyerModelForChat{
  String userType;
  String mobileNo;
  String buyerName;
  String buyerCode;
  String buyerProvince;
  String buyerCity;
  bool lastMessageSeen;
  BuyerModelForChat({this.buyerCode,this.buyerCity, this.lastMessageSeen, this.buyerName,this.buyerProvince,this.mobileNo,this.userType});
}


class ShopModelForChat{
  String userType;
  String mobileNo;
  String shopName;
  String shopCode;
  String shopProvince;
  String shopCity;
  bool lastMessageSeen;
  ShopModelForChat(
      {this.userType,
      this.mobileNo,
      this.shopName,
      this.shopCode,
      this.shopProvince,
      this.shopCity,
      this.lastMessageSeen});
}

class Message{
  String text;
  String date;
  BuyerModelForChat buyer;
  ShopModelForChat shop;
  Message({this.text, this.date, this.buyer, this.shop});
}

class ChatModel{
  BuyerModelForChat buyer;
  ShopVitrineModel shop;
  String chatCode;
}
