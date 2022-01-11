import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/buyers/home/tourism.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/product.dart';

class BuyerHome extends StatefulWidget {
  const BuyerHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerHomeState();
}

class BuyerHomeState extends State<BuyerHome> {
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

                          ///image slider - commercial
                          CarouselWithIndicatorDemo( items: [
                            ImageSliderItem('assets/image/off50.jpg', () {
                              print("Image taaaaaaap 11111");
                            }),
                            ImageSliderItem('assets/image/man_off.jpg', () {
                              print("Image taaaaaaap 22222");
                            }),
                            ImageSliderItem('assets/image/off50.jpg', () {
                              print("Image taaaaaaap 33333");
                            }),
                          ]),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),

                          ///tourism
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const Tourism()));
                            },
                            child: SizedBox(
                              width: MyStyle.mediaQueryWidth(context, 0.92),
                                child: Stack(children: [
                                  Center(
                                    child: ClipRRect( borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                        child: Image.asset('assets/image/zanjan_bazar.jpg')),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding:  EdgeInsets.only(top: MyStyle.mediaQueryHeight(context, 0.03),),
                                      child: Text("معرفی جاذبه های دیدنی\n${AppConstants.BUYER_CITY}",
                                        style: const TextStyle(
                                          color: MyStyle.white,
                                          fontSize: MyStyle.S17,
                                          fontFamily: MyStyle.headerFont,
                                          shadows:  <Shadow>[
                                            Shadow(
                                              offset: Offset(1.0, 2.0),
                                              blurRadius: 4.0,
                                              color: Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            // Shadow(
                                            //   offset: Offset(10.0, 10.0),
                                            //   blurRadius: 8.0,
                                            //   color: Color.fromARGB(125, 0, 0, 255),
                                            // ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],)),
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          ///header most selled
                          Padding(
                            padding: EdgeInsets.only( left: MyStyle.mediaQueryWidth(context, 0.04),
                              right: MyStyle.mediaQueryWidth(context, 0.04),),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(AppConstants.BUYER_CITY, style: MyStyle.redSmallHeaderStyle,),
                                const Text("پر فروش های" , style: MyStyle.redSmallHeaderStyle,),
                              ],
                            ),
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                ProductWidget(name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/men_shirt.jpg',
                                  isRemovable:false,
                                  star: 4.5,),
                                ProductWidget(name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/men_shirt.jpg',
                                  isRemovable:false,
                                  star: 4.5,),
                                ProductWidget(name: "پیراهن آستین بلند مردانه",
                                  code: "hgd65435hj" ,
                                  cost: 123000,
                                  imagePath: 'assets/image/men_shirt.jpg',
                                  isRemovable:false,
                                  star: 4.5,),

                              ],
                            ),
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          InkWell(
                            onTap: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/backward.svg',color: MyStyle.lightGrayText),
                                SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                const Text("مشاهده ی همه ی محصولات" , style: MyStyle.lightGrayTextStyleS13,),
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
                index: 0,
              ),
            )));
  }
}
