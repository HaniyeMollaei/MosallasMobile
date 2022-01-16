import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/pages/buyers/shops/online_shop.dart';
import 'package:mosallas/pages/comments.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/comment_pink_box.dart';
import 'package:mosallas/widgets/comment_slider_manually.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/favorite_vitrine.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';
import 'package:mosallas/widgets/submit_button.dart';

class BuyerProductPage extends StatefulWidget {

  final ProductItem product;
  const BuyerProductPage({Key key, this.product, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerProductPageState();
}

class BuyerProductPageState extends State<BuyerProductPage> {


  String shopName = "فروشگاه لباس مجلسی ایلگا";

  @override
  Widget build(BuildContext c) {
    List<CommentItem> cmList =  [
      CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی"),
      CommentItem(
          text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.",
          author: "امیر شمس"),
      CommentItem(
          text:
          "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
          author: "سارا نیکوکار"),
      CommentItem(text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
    ];

    ShopVitrineItem shop =  ShopVitrineItem(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi99",
        star: 4.3,
        shippingCost: 12000,
        phoneNumber: "09123456789",
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/6.jpg","assets/image/12.jpg"]
    );

    Widget slider = ManuallyControlledImageSlider(isCommercial: false, items: [
      ImageSliderItem('assets/image/5.jpg', () {}),
      ImageSliderItem('assets/image/6.jpg', () {}),
      ImageSliderItem('assets/image/9.jpg', () {}),
      ImageSliderItem('assets/image/8.jpg', () {}),
    ]);


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
                    pageHeaderNameLarge: shopName ,
                    pageHeaderNameSmall:"",
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                    child: SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.72),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            slider,

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                            Container(
                              padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
                              decoration: BoxDecoration(
                                color: MyStyle.white,
                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset("assets/svg/star.svg" ,fit: BoxFit.fitHeight, height: MyStyle.mediaQueryHeight(context, 0.02),),
                                          SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                          Text(widget.product.star.toString() , style: MyStyle.lightPinkTextStyleS13,),
                                        ],
                                      ),
                                      Text("${widget.product.code}  ${widget.product.name}" ,textAlign: TextAlign.end, style: MyStyle.darkTextStyleS15,maxLines: 2,)
                                    ],),
                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text("تومان" , style: MyStyle.lightPinkTextStyleS13,),
                                          Text(widget.product.cost.toString() , style: MyStyle.lightPinkTextStyleS13,),
                                        ],
                                      ),
                                      Text( widget.product.category ?? "بدون دسته بندی", style: MyStyle.lightGrayTextStyleS13,)
                                    ],),
                                ],
                              ),
                            ),

                            widget.product.hasOnlineSell ?
                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),):Container(),


                            widget.product.hasOnlineSell ?
                            SubmitButton(
                                text: "  خرید آنلاین  ",
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation1, animation2) => OnlineShopPage(
                                       product: widget.product,
                                      ),
                                      transitionDuration: Duration.zero,
                                    ),
                                  );                                },
                              width: MyStyle.mediaQueryWidth(context, 0.5),
                              height: MyStyle.mediaQueryHeight(context, 0.06),
                              textSize: MyStyle.S13,
                            ):Container(),

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                            ///description
                            Container(
                              width: MyStyle.mediaQueryWidth(context, 0.92),
                              decoration: BoxDecoration(
                                color: MyStyle.white,
                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: MyStyle.mediaQueryWidth(context, 0.03),
                                  vertical: MyStyle.mediaQueryHeight(context, 0.02)),
                              child: Text(
                                widget.product.description,
                                style: MyStyle.lightGrayTextStyleS13,
                                textAlign: TextAlign.right,
                              ),
                            ),

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),


                            ///comment - call - chat
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                callAndChat(
                                  context: c,
                                  shopCode: widget.product.shopCode,
                                  phoneNumber: shop.phoneNumber,
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
                                            header: slider,
                                            type: "product",
                                            code: widget.product.code,
                                          ),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );
                                    }),
                              ],
                            ),

                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),



                          ],
                        ),
                      )
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
