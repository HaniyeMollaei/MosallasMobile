import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';

class BuyerCityShops extends StatefulWidget {
  const BuyerCityShops({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerCityShopsState();
}

class BuyerCityShopsState extends State<BuyerCityShops> {
  List<ShopVitrineItem> shops = [
    ShopVitrineItem(
      shopName: "فروشگاه لباس مجلسی ایلگا",
      address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
      shopCode: "mnb876gi99",
        phoneNumber: "09123456789",
        shippingCost: 12000,
        star: 4.3,
      shopImagePath: "assets/image/ilga.jpg",
      productsImagePath: ["assets/image/6.jpg","assets/image/12.jpg"]
    ),
    ShopVitrineItem(
        shopName: "فروشگاه لباس ورزشی یونیک",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        phoneNumber: "09123456789",
        shopCode: "mnb876gi90",
        shippingCost: 12000,
        star: 3.8,
        shopImagePath: "assets/image/7.jpg",
        productsImagePath: ["assets/image/8.jpg","assets/image/9.jpg","assets/image/10.png"]
    ),
    ShopVitrineItem(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi99",
        phoneNumber: "09123456789",
        shippingCost: 12000,
        star: 4.3,
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/5.jpg","assets/image/6.jpg","assets/image/12.jpg"]
    ),
    ShopVitrineItem(
        shopName: "فروشگاه لباس ورزشی یونیک",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        phoneNumber: "09123456789",
        shopCode: "mnb876gi90",
        shippingCost: 12000,
        star: 3.8,
        shopImagePath: "assets/image/7.jpg",
        productsImagePath: ["assets/image/9.jpg"]
    ),
  ];


  @override
  Widget build(BuildContext c) {
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
                  ///Logo --> 1.5
                  const MediumLogo(
                    finalType: "location",
                  ),
                  ///category
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyDrawer(
                          text: "همه",
                          content:  const ["پوشاک" ,"لوازم خانگی","خوار و بار","پارچه فروشی","قطعات خودرو",],
                          attribute: "CATEGORY_SEARCH",
                        ),
                        const Text(":دسته بندی" , style:MyStyle.darkTextStyleS13 , textAlign: TextAlign.end,),
                      ],
                    ),
                  ),

                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),

                  Container(
                    height: MyStyle.mediaQueryHeight(context, 0.68),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),

                          ///0.72-0.37
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              shrinkWrap: true,
                              itemExtent: null,
                              physics: BouncingScrollPhysics(),
                              itemCount: shops.length,
                              itemBuilder: (BuildContext c, int index) {
                                return shopVitrine(context: c,shopVitrineItem: shops[index],);
                              }),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BuyerBottomNavBar(
                index: 2,
              ),
            )));
  }
}
