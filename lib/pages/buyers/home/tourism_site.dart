import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/pages/buyers/home/tourism_site_comments.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/slider_manually.dart';

class TourismSite extends StatefulWidget {
  final String tourismSiteCode;
  const TourismSite({Key key, this.tourismSiteCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TourismSiteState();
}

class TourismSiteState extends State<TourismSite> {
  String siteName = "بازار سنتی زنجان";
  String description =
      "بازار زنجان طولانی ترین بازار سرپوشیده ایران است.این بازار در دوران آغا محمد خان قاجار آغاز و در سال ۱۲۱۳ در زمان فتحعلی شاه قاجار خاتمه یافته و مساجد و سراها،  گرمابه‌ها در سال ۱۳۲۴ به آن اضافه شده‌است...";
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
                  ///Logo --> 1.8
                  GrayAppBar(
                    pageHeaderNameSmall: "معرفی",
                    pageHeaderNameLarge: siteName,
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.72),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CarouselWithIndicatorDemo(isCommercial: false, items: [
                            ImageSliderItem('assets/image/zanjan_bazar.jpg', () {
                              print("Image taaaaaaap 11111");
                            }),
                            ImageSliderItem('assets/image/zanjan_bazar3.jpg', () {
                              print("Image taaaaaaap 33333");
                            }),
                            ImageSliderItem('assets/image/zanjan_bazar4.jpg', () {
                              print("Image taaaaaaap 33333");
                            }),
                            ImageSliderItem('assets/image/zanjan_bazar5.jpg', () {
                              print("Image taaaaaaap 33333");
                            }),
                          ]),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),
                          Container(
                            width: MyStyle.mediaQueryWidth(context, 0.88),
                            decoration: BoxDecoration(
                              color: MyStyle.white,
                              borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: MyStyle.mediaQueryWidth(context, 0.03),
                                vertical: MyStyle.mediaQueryHeight(context, 0.02)),
                            child: Text(
                              description,
                              style: MyStyle.lightGrayTextStyleS13,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.03),
                          ),
                          Container(
                            width: MyStyle.mediaQueryWidth(context, 0.92),
                            decoration: BoxDecoration(
                              color: MyStyle.headerDarkPink,
                              borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: MyStyle.mediaQueryWidth(context, 0.015),
                                vertical: MyStyle.mediaQueryHeight(context, 0.015)),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: MyStyle.mediaQueryWidth(context, 0.02)),
                                    child: const Text(
                                      "آخرین نظرات در مورد این جاذبه  ",
                                      style: MyStyle.whiteLightTextStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MyStyle.mediaQueryHeight(context, 0.01),
                                ),
                                ManuallyControlledSlider(
                                  items: [
                                    CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی"),
                                    CommentItem(
                                        text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.",
                                        author: "امیر شمس"),
                                    CommentItem(
                                        text:
                                            "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
                                        author: "سارا نیکوکار"),
                                    CommentItem(text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
                                  ],
                                ),
                                SizedBox(
                                  height: MyStyle.mediaQueryHeight(context, 0.01),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => const TourismSiteComments(),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );
                                     },
                                    child: const Text(
                                      "    همه ی نظرات",
                                      style: MyStyle.whiteLightTextStyle,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.03),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BuyerBottomNavBar(
                index: 0,
              ),
            )));
  }
}
