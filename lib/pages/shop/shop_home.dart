import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShopHomeState();
}

class ShopHomeState extends State<ShopHome> {
  List<ImageSliderItem> imageList = [
    ImageSliderItem('assets/image/off50.jpg', () {
      print("Image taaaaaaap 11111");
    }),
    ImageSliderItem('assets/image/man_off.jpg', () {
      print("Image taaaaaaap 22222");
    }),
    ImageSliderItem('assets/image/off50.jpg', () {
      print("Image taaaaaaap 33333");
    }),
  ];

  ShopVitrineModel shop = ShopVitrineModel(
      shopName: "فروشگاه لباس مجلسی ایلگا",
      address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
      shopCode: "mnb876gi99",
      phoneNumber: "09123456789",
      shippingCost: 12000,
      star: 4.3,
      shopImagePath: "assets/image/ilga.jpg",
      productsImagePath: ["assets/image/6.jpg", "assets/image/12.jpg"]);

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
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.75),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          shopVitrine(context: c,shopVitrineItem: shop,justHeader: true),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),

                          ///image slider - commercial
                          CarouselWithIndicatorDemo(items: imageList),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),
                          callAndChat(context: c , shopCode: shop.shopName , justChat: true , ),


                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: [
                          //       ProductWidget(
                          //         p: ProductModel(
                          //           name: "پیراهن آستین بلند مردانه",
                          //           code: "hgd65435hj",
                          //           cost: 123000,
                          //           imagePath: ['assets/image/5.jpg'],
                          //           isRemovable: false,
                          //           star: 4.5,
                          //           hasOnlineSell: true,
                          //           category: "پوشاک",
                          //           description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                          //           shopCode: "063487",
                          //         ),
                          //       ),
                          //       ProductWidget(
                          //         p: ProductModel(
                          //           name: "پیراهن آستین بلند مردانه",
                          //           code: "hgd65435hj",
                          //           cost: 123000,
                          //           description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                          //           imagePath: ['assets/image/6.jpg'],
                          //           isRemovable: false,
                          //           star: 4.5,
                          //           shopCode: "063487",
                          //           hasOnlineSell: true,
                          //           category: "پوشاک",
                          //         ),
                          //       ),
                          //       ProductWidget(
                          //         p: ProductModel(
                          //           hasOnlineSell: true,
                          //           category: "پوشاک",
                          //           description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                          //           name: "پیراهن آستین بلند مردانه",
                          //           code: "hgd65435hj",
                          //           cost: 123000,
                          //           imagePath: [
                          //             'assets/image/12.jpg',
                          //             'assets/image/10.jpg',
                          //           ],
                          //           isRemovable: false,
                          //           star: 4.5,
                          //           shopCode: "063487",
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: MyStyle.mediaQueryHeight(context, 0.03),
                          // ),
                          //
                          // InkWell(
                          //   onTap: () {},
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       SvgPicture.asset('assets/svg/backward.svg', color: MyStyle.lightGrayText),
                          //       SizedBox(
                          //         width: MyStyle.mediaQueryWidth(context, 0.01),
                          //       ),
                          //       const Text(
                          //         "مشاهده ی همه ی محصولات",
                          //         style: MyStyle.lightGrayTextStyleS13,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: MyStyle.mediaQueryHeight(context, 0.03),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const ShopBottomNavBar(
                index: 0,
              ),
            )));
  }
}
