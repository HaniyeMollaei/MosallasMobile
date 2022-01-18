import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/address.dart';
import 'package:mosallas/models/order_model.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/order.dart';

class AllBuyerOrders extends StatefulWidget {
  final bool isForShop;
  const AllBuyerOrders({Key key, this.isForShop}) : super(key: key);

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
                  widget.isForShop
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                              color: MyStyle.headerDarkPink,
                            ),
                            height: MyStyle.mediaQueryHeight(context, 0.06),
                            width: MyStyle.mediaQueryWidth(context, 0.92),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "بارگذاری مجدد",
                                    style: TextStyle(fontSize: MyStyle.S15, fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                                  ),
                                  SizedBox(
                                    width: MyStyle.mediaQueryWidth(context, 0.02),
                                  ),
                                  SvgPicture.asset(
                                    "assets/svg/referesh.svg",
                                    color: MyStyle.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  widget.isForShop
                      ? SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.02),
                        )
                      : Container(),

                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, widget.isForShop ? 0.64 : 0.8),
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
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                  child: orderItemWidget(context: c, orderItem: orders[index], isGray: false),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: widget.isForShop
                  ? const ShopBottomNavBar(
                      index: 1,
                    )
                  : Container(),
            )));
  }
}
