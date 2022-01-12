import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/product.dart';

class BuyerProfile extends StatefulWidget {
  const BuyerProfile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerProfileState();
}

class BuyerProfileState extends State<BuyerProfile> {
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

                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          InkWell(
                            onTap: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/backward.svg',color: MyStyle.lightGrayText),
                                SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                const Text("مشاهده ی همه ی محصولات" , style: MyStyle.lightGrayTextStyleS11,),
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
                index: 3,
              ),
            )));
  }
}
