import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/product.dart';

class BuyerShops extends StatefulWidget {
  const BuyerShops({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerShopsState();
}

class BuyerShopsState extends State<BuyerShops> {
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
                  Container(
                    height: MyStyle.mediaQueryHeight(context, 0.75),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                                const Text(":دسته بندی" , style:MyStyle.darkTextStyle , textAlign: TextAlign.end,),
                              ],
                            ),
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
