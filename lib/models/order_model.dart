
class OrderModel {
  String orderCode;
  String orderDate;
  String orderStatus;
  String productName;
  int productCost;
  String productCode;
  String shopName;
  String shopAddress;
  String shopPhoneNumber;

  OrderModel({this.orderCode , this.orderDate ,this.orderStatus
    ,this.shopName , this.shopAddress , this.shopPhoneNumber ,
    this.productCode , this.productCost , this.productName});
}
