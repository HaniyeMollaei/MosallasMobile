import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';

class BuyerAllProducts extends StatefulWidget {
  final String shopCode;
  const BuyerAllProducts({Key key, this.shopCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerAllProductsState();
}

class BuyerAllProductsState extends State<BuyerAllProducts> {
  List<ShopVitrineItem> shops = [
    ShopVitrineItem(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi99",
        star: 4.3,
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/6.jpg", "assets/image/12.jpg"]),
    ShopVitrineItem(
        shopName: "فروشگاه لباس ورزشی یونیک",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi90",
        star: 3.8,
        shopImagePath: "assets/image/7.jpg",
        productsImagePath: ["assets/image/8.jpg", "assets/image/9.jpg", "assets/image/10.png"]),
    ShopVitrineItem(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi99",
        star: 4.3,
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/5.jpg", "assets/image/6.jpg", "assets/image/12.jpg"]),
    ShopVitrineItem(
        shopName: "فروشگاه لباس ورزشی یونیک",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi90",
        star: 3.8,
        shopImagePath: "assets/image/7.jpg",
        productsImagePath: ["assets/image/9.jpg"]),
  ];

  String shopName = "فروشگاه لباس مجلسی ایلگا";
  List<ProductItem> myProducts;

  @override
  Widget build(BuildContext c) {
    myProducts = [
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/5.jpg','assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/5.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath:[ 'assets/image/5.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/6.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
      ProductItem(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: widget.shopCode),
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
                  ///Logo --> 1.5
                  GrayAppBar(
                    pageHeaderNameLarge: shopName,
                    pageHeaderNameSmall: "تمامی محصولات موجود در",
                  ),

                  SingleChildScrollView(
                    child: SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.72),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: MyStyle.mediaQueryHeight(context, 0.32),
                          ),
                          itemCount: myProducts.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                child: ProductWidget(
                                  p: myProducts[index],
                                ));
                          }),
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
