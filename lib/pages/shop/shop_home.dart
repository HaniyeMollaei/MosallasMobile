import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/comment_model.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/buyers/shops/all_products.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/comment_pink_box.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';
import 'package:mosallas/widgets/submit_button.dart';

import '../comments.dart';

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

  List<CommentItem> cmList = [
    CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی"),
    CommentItem(text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.", author: "امیر شمس"),
    CommentItem(
        text: "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
        author: "سارا نیکوکار"),
    CommentItem(text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
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

  Widget slider;


  @override
  Widget build(BuildContext c) {

    slider = ManuallyControlledImageSlider(
      items: imageList,
      isCommercial: true,
    );

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
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                                    color: MyStyle.headerDarkPink,
                                  ),
                                  height: MyStyle.mediaQueryHeight(context, 0.06),
                                  width: MyStyle.mediaQueryWidth(context, 0.45),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "افزودن بنر به ویترین",
                                          maxLines: 2,
                                          style: TextStyle(fontSize: MyStyle.S15 ,fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                                        ),
                                        SizedBox(
                                          width: MyStyle.mediaQueryWidth(context, 0.02),
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/plus.svg",
                                          color: MyStyle.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                                    color: MyStyle.headerDarkPink,
                                  ),
                                  height: MyStyle.mediaQueryHeight(context, 0.06),
                                  width: MyStyle.mediaQueryWidth(context, 0.45),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "ویرایش اطلاعات",
                                          style: TextStyle(fontSize: MyStyle.S15, fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(left: MyStyle.mediaQueryWidth(context, 0.08),),
                                          child: SvgPicture.asset(
                                            "assets/svg/edit.svg",
                                            color: MyStyle.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],),
                          ),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),
                          ///image slider - commercial
                          slider,
                          ///comment - call - chat
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                callAndChat(
                                  context: c,
                                  shopCode: shop.shopCode,
                                  justChat: true
                                ),
                                commentPinkBox(
                                    context: c,
                                    hasSideWidget: true,
                                    cmList: cmList,
                                    type: "shop",
                                    routToCommentsPage: () async {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => Comments(
                                            header: Container(),
                                            type: "shop",
                                            code: shop.shopCode,
                                            isForShop: true,
                                          ),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.03),
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ProductWidget(
                                  p: ProductModel(
                                    name: "پیراهن آستین بلند مردانه",
                                    code: "hgd65435hj",
                                    cost: 123000,
                                    imagePath: ['assets/image/5.jpg'],
                                    isRemovable: false,
                                    star: 4.5,
                                    hasOnlineSell: true,
                                    category: "پوشاک",
                                    description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                    shopCode: "063487",
                                  ),
                                ),
                                ProductWidget(
                                  p: ProductModel(
                                    name: "پیراهن آستین بلند مردانه",
                                    code: "hgd65435hj",
                                    cost: 123000,
                                    description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                    imagePath: ['assets/image/6.jpg'],
                                    isRemovable: false,
                                    star: 4.5,
                                    shopCode: "063487",
                                    hasOnlineSell: true,
                                    category: "پوشاک",
                                  ),
                                ),
                                ProductWidget(
                                  p: ProductModel(
                                    hasOnlineSell: true,
                                    category: "پوشاک",
                                    description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                    name: "پیراهن آستین بلند مردانه",
                                    code: "hgd65435hj",
                                    cost: 123000,
                                    imagePath: [
                                      'assets/image/12.jpg',
                                      'assets/image/10.jpg',
                                    ],
                                    isRemovable: false,
                                    star: 4.5,
                                    shopCode: "063487",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.03),
                          ),

                          SubmitButton(
                            text: "ویرایش محصولات ویترین",
                            textSize: MyStyle.S17,
                            onPressed: () async {
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => AllProducts(shopCode: shop.shopCode,isBuyer:false,isShopVitrine: true,)));

                            },
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),
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
