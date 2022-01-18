
import 'address.dart';

class OrderModel {
  String orderCode;
  String orderDate;
  String orderStatus;
  String productName;
  int productCost;
  String productCode;
  String shopName;
  AddressModel shopAddress;
  String shopPhoneNumber;
  String buyerName;
  AddressModel buyerAddress;
  String buyerPhoneNumber;

  OrderModel({this.orderCode , this.orderDate ,this.orderStatus
    ,this.shopName , this.shopAddress , this.shopPhoneNumber ,
    this.productCode , this.productCost , this.productName,
    this.buyerAddress,this.buyerName,this.buyerPhoneNumber
  });
}
