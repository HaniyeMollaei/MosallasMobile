import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/order.dart';
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
                    padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                    height: MyStyle.mediaQueryHeight(context, 0.75),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          ///User Info
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyStyle.mediaQueryWidth(context, 0.06),
                              vertical: MyStyle.mediaQueryHeight(context, 0.02)
                            ),
                            decoration: BoxDecoration(
                              color: MyStyle.lightGrayText,
                              borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                            ),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset("assets/svg/exit.svg"),
                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                                    SvgPicture.asset("assets/svg/edit.svg")
                                  ],),
                                  Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(AppConstants.BUYER_NAME ?? "بدون نام" ,textAlign: TextAlign.end, style: MyStyle.whiteMediumTextStyle,),
                                      SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                                      SvgPicture.asset("assets/svg/person.svg")
                                    ],)
                                ],),
                                SizedBox(
                                  height: MyStyle.mediaQueryHeight(context, 0.01),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: MyStyle.mediaQueryWidth(context, 0.1)),
                                    child: Text(AppConstants.MOBILE_NUMBER ?? "09124424805" , style: MyStyle.whiteMediumTextStyle,),
                                  ),
                                ),
                                SizedBox(
                                  height: MyStyle.mediaQueryHeight(context, 0.01),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width:MyStyle.mediaQueryWidth(context, 0.65),
                                      child: Text(AppConstants.BUYER_NAME ?? "زنجان، سلطانیه، خیابان پاسداران، نبش کوچه ی حکمت، پلاک 82" ,
                                        maxLines: 2,
                                        style: MyStyle.whiteMediumTextStyle,textAlign: TextAlign.end,
                                        overflow: TextOverflow.ellipsis,),
                                    ),
                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                                    SvgPicture.asset("assets/svg/location.svg",color: MyStyle.white.withOpacity(0.6),)
                                  ],)
                              ],
                            ),
                          ),

                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          ///Orders List
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MyStyle.mediaQueryWidth(context, 0.04),
                                vertical: MyStyle.mediaQueryHeight(context, 0.02)
                            ),
                            decoration: BoxDecoration(
                              color: MyStyle.white,
                              borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("لیست سفارشات",style: MyStyle.redMediumHeaderStyle,),
                                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),
                                orderItemWidget(
                                  context: c,
                                  orderItem: OrderItem(
                                    orderCode: "AC10004ON123456",
                                    orderDate: "1400/05/07",
                                    orderStatus: "WaitForShop",
                                    productCode: "G1AC10004",
                                    productCost: 20000,
                                    productName: "کش موی ابریشمی",
                                    shopPhoneNumber: "09124424805",
                                    shopName: "فروشگاه لباس مجلسی ایلگا",
                                    shopAddress: "زنجان، زنجان، خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16"
                                  )
                                ),
                                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),
                                InkWell(
                                  onTap: (){
                                    ///TODO
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                     // SvgPicture.asset("assets/svg/backward.svg" , color: MyStyle.darkGrayText,),
                                     // SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                      const Text("مشاهده ی همه ی سفارشات",style: MyStyle.darkTextStyleS13,),
                                      SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                      SvgPicture.asset("assets/svg/forward.svg" , color: MyStyle.darkGrayText,),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

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
