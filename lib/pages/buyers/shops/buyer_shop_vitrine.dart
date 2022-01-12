import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/buyers/home/tourism_site_comments.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/comment_pink_box.dart';
import 'package:mosallas/widgets/comment_slider_manually.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';
import 'package:mosallas/widgets/submit_button.dart';

import 'all_products.dart';

class BuyerShopVitrine extends StatefulWidget {
  final String shopCode;
  final Widget shopHeader;
  const BuyerShopVitrine({Key key, this.shopCode, this.shopHeader}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerShopVitrineState();
}

class BuyerShopVitrineState extends State<BuyerShopVitrine> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   header =  ManuallyControlledImageSlider(
    //     items: imageList,
    //     isCommercial: true,
    //   ) as Future<Widget>;
    // });
  }

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

  String phoneNumber = "09908733108";

  Widget slider;
  Future getHeader() async {
    slider = await ManuallyControlledImageSlider(
      items: imageList,
      isCommercial: true,
    );
    return slider;
  }

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///Logo --> 1.5
                  const MediumLogo(
                    finalType: "location",
                  ),
                  Container(
                    height: MyStyle.mediaQueryHeight(context, 0.75),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///header
                          widget.shopHeader,

                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.01),
                          ),

                          ///header
                          FutureBuilder(
                              future: getHeader(),
                              builder: (
                                BuildContext context,
                                AsyncSnapshot snapshot,
                              ) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    color: MyStyle.darkPink,
                                  ));
                                } else if (snapshot.connectionState == ConnectionState.done) {
                                  return snapshot.data;
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                        color: MyStyle.darkPink,
                                      ));
                                }
                              }),

                         ///comment - call - chat
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                callAndChat(
                                  context: c,
                                  shopCode: widget.shopCode,
                                  phoneNumber: phoneNumber,
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
                                          pageBuilder: (context, animation1, animation2) => TourismSiteComments(
                                            header: widget.shopHeader,
                                            type: "shop",
                                            shopCode: widget.shopCode,
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
                              children:  [
                                ProductWidget(p: ProductItem(
                                  name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/5.jpg',
                                  isRemovable:false,
                                  star: 4.5,
                                ),),
                                ProductWidget(p: ProductItem(name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/6.jpg',
                                  isRemovable:false,
                                  star: 4.5,),),
                                ProductWidget(p: ProductItem(
                                  name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/12.jpg',
                                  isRemovable:false,
                                  star: 4.5,
                                ),),

                              ],
                            ),
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          SubmitButton(
                           text: "مشاهده ی تمامی محصولات",
                            textSize: MyStyle.S17,
                            onPressed: () async {
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => BuyerAllProducts(shopCode: widget.shopCode,)));

                            },
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

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
