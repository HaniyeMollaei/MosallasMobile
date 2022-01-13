import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/product.dart';
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

                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                      child: SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.72),
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

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),

                            widget.product.hasOnlineSell ?
                            SubmitButton(
                                text: "خرید آنلاین",
                                onPressed: (){print("Buy Online");},
                              width: MyStyle.mediaQueryWidth(context, 0.5),
                              height: MyStyle.mediaQueryHeight(context, 0.06),
                              textSize: MyStyle.S15,
                            ):Container(),



                          ],
                        )
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
