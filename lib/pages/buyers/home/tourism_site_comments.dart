import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';

class TourismSiteComments extends StatefulWidget {
  const TourismSiteComments({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TourismSiteCommentsState();
}

class TourismSiteCommentsState extends State<TourismSiteComments> {
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
