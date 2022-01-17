class ShopVitrineModel {
  String shopName;
  String address;
  String phoneNumber;
  double star;
  int shippingCost;
  String shopImagePath;
  String shopCode;
  List<String> productsImagePath;
  ShopVitrineModel({this.shopName , this.address , this.star , this.shopCode ,
    this.shopImagePath , this.productsImagePath , this.phoneNumber , this.shippingCost});
}