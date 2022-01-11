import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/tourism_site_widget.dart';

class Tourism extends StatefulWidget {
  const Tourism({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TourismState();
}

class TourismState extends State<Tourism> {
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
                    pageHeaderNameSmall: "معرفی جاذبه های دیدنی",
                    pageHeaderNameLarge: "شهرستان ${AppConstants.BUYER_CITY}",
                  ),
                  Container(
                    height: MyStyle.mediaQueryHeight(context, 0.72),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          TourismSiteLeftImage(
                            siteName: "بازار سنتی زنجان",
                            description: "بازار زنجان طولانی ترین بازار سرپوشیده ایران است.این بازار در دوران آغا محمد خان قاجار آغاز و در سال ۱۲۱۳ در زمان فتحعلی شاه قاجار خاتمه یافته و مساجد و سراها،  گرمابه‌ها در سال ۱۳۲۴ به آن اضافه شده‌است...",
                            onTap: (){},
                            imagePath: 'assets/image/zanjan_bazar2.jpg',
                          ),

                          TourismSiteRightImage(
                            siteName: "بازار سنتی زنجان",
                            description: "بازار زنجان طولانی ترین بازار سرپوشیده ایران است.این بازار در دوران آغا محمد خان قاجار آغاز و در سال ۱۲۱۳ در زمان فتحعلی شاه قاجار خاتمه یافته و مساجد و سراها،  گرمابه‌ها در سال ۱۳۲۴ به آن اضافه شده‌است...",
                            onTap: (){},
                            imagePath: 'assets/image/zanjan_bazar2.jpg',
                          ),

                          TourismSiteLeftImage(
                            siteName: "بازار سنتی زنجان",
                            description: "بازار زنجان طولانی ترین بازار سرپوشیده ایران است.این بازار در دوران آغا محمد خان قاجار آغاز و در سال ۱۲۱۳ در زمان فتحعلی شاه قاجار خاتمه یافته و مساجد و سراها،  گرمابه‌ها در سال ۱۳۲۴ به آن اضافه شده‌است...",
                            onTap: (){},
                            imagePath: 'assets/image/zanjan_bazar2.jpg',
                          ),


                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

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
