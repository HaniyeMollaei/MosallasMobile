import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/order_model.dart';
import 'package:mosallas/models/tourism_site_model.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/order.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/tourism_site_widget.dart';

class AllBuyerOrders extends StatefulWidget {
  const AllBuyerOrders({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllBuyerOrdersState();
}

class AllBuyerOrdersState extends State<AllBuyerOrders> {

  List<OrderModel> orders;

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
          shopAddress: "زنجان، زنجان، خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"
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
          shopAddress: "زنجان، زنجان، خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"
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
          shopAddress: "زنجان، زنجان، خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"
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
          shopAddress: "زنجان، زنجان، خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"
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
                  Container(
                    height: MyStyle.mediaQueryHeight(context, 0.8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          ///0.72-0.37
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              shrinkWrap: true,
                              itemExtent: null,
                              physics: BouncingScrollPhysics(),
                              itemCount: orders.length,
                              itemBuilder: (BuildContext c, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                  child: orderItemWidget(context: c,orderItem: orders[index],isGray: false),
                                );
                              }),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
