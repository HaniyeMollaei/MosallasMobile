import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/address.dart';
import 'package:mosallas/models/order_model.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_admin.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/order.dart';
import 'package:mosallas/widgets/submit_button.dart';

class CheckOrders extends StatefulWidget {
  const CheckOrders({Key key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CheckOrdersState();
}

class CheckOrdersState extends State<CheckOrders> {
  List<OrderModel> orders;


  Widget onOrderTap(){
    return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.92),
        height: MyStyle.mediaQueryHeight(context, 0.4),
        hasCancel: true,
        hasButton: false,
        hasHeader: false,
        //headerText: "وضعیت سفارش",
        context: context,
        content: Column(
          children: [
            SubmitButton(
              text: "گفت و گو با خریدار",
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.01),
            ),
            SubmitButton(
              text: "لغو سفارش و بازگرداندن پول",
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.01),
            ),SubmitButton(
              text: "سفارش ارسال شد",
              buttonColor: MyStyle.green,
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.01),
            ),          ],
        )
    );
  }


  @override
  Widget build(BuildContext c) {
    orders = [
      OrderModel(
        orderCode: "AC10004ON123456",
        orderDate: "1400/05/07",
        orderStatus: "WaitForShop",
        productCode: "G1AC10004",
        productCost: 20000,
        productName: "کش موی ابریشمی",
        shopPhoneNumber: "09124424805",
        shopName: "فروشگاه لباس مجلسی ایلگا",
        shopAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"),
        buyerName: AppConstants.BUYER_NAME ?? "بدون نام",
        buyerPhoneNumber: AppConstants.BUYER_PROVINCE ?? "_",
        buyerAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان فاتح، کوچه ی نبوی، پلاک 87 "),
      ),
      OrderModel(
        orderCode: "AC10004ON123456",
        orderDate: "1400/05/07",
        orderStatus: "Sent",
        productCode: "G1AC10004",
        productCost: 20000,
        productName: "کش موی ابریشمی",
        shopPhoneNumber: "09124424805",
        shopName: "فروشگاه لباس مجلسی ایلگا",
        shopAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"),
        buyerName: AppConstants.BUYER_NAME ?? "بدون نام",
        buyerPhoneNumber: AppConstants.BUYER_PROVINCE ?? "_",
        buyerAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان فاتح، کوچه ی نبوی، پلاک 87 "),
      ),
      OrderModel(
        orderCode: "AC10004ON123456",
        orderDate: "1400/05/07",
        orderStatus: "Wait",
        productCode: "G1AC10004",
        productCost: 20000,
        productName: "کش موی ابریشمی",
        shopPhoneNumber: "09124424805",
        shopName: "فروشگاه لباس مجلسی ایلگا",
        shopAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"),
        buyerName: AppConstants.BUYER_NAME ?? "بدون نام",
        buyerPhoneNumber: AppConstants.BUYER_PROVINCE ?? "_",
        buyerAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان فاتح، کوچه ی نبوی، پلاک 87 "),
      ),
      OrderModel(
        orderCode: "AC10004ON123456",
        orderDate: "1400/05/07",
        orderStatus: "WaitForShop",
        productCode: "G1AC10004",
        productCost: 20000,
        productName: "کش موی ابریشمی",
        shopPhoneNumber: "09124424805",
        shopName: "فروشگاه لباس مجلسی ایلگا",
        shopAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"),
        buyerName: AppConstants.BUYER_NAME ?? "بدون نام",
        buyerPhoneNumber: AppConstants.BUYER_PROVINCE ?? "_",
        buyerAddress: AddressModel(city: "زنجان", province: "زنجان", address: "  خیابان فاتح، کوچه ی نبوی، پلاک 87 "),
      ),
    ];


    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: MyStyle.backgroundColor,
              body: Column(
                children: [
                  ///Logo --> 1.8
                  const GrayAppBar(
                    pageHeaderNameSmall: "",
                    pageHeaderNameLarge: "سفارشات",
                  ),
                 
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context,  0.62),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///0.72-0.37
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              shrinkWrap: true,
                              itemExtent: null,
                              physics: const BouncingScrollPhysics(),
                              itemCount: orders.length,
                              itemBuilder: (BuildContext c, int index) {
                                return orderItemWidget(context: c, orderItem: orders[index], isGray: false , onTap: onOrderTap );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const AdminBottomNavBar(index: 1,)
            )));
  }
}
