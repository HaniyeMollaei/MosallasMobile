import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/order_model.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/favorite_vitrine.dart';
import 'package:mosallas/widgets/order.dart';
import 'package:mosallas/widgets/text_field.dart';

import 'all_buyer_orders.dart';

class BuyerProfile extends StatefulWidget {
  const BuyerProfile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerProfileState();
}

class BuyerProfileState extends State<BuyerProfile> {

  List<ProductModel> favorites;

  final TextEditingController _txtName = TextEditingController();
  final FocusNode _fndName = FocusNode();

  final TextEditingController _txtAddress = TextEditingController();
  final FocusNode _fndAddress = FocusNode();

  final TextEditingController _txtPostalCode = TextEditingController();
  final FocusNode _fndPostalCode = FocusNode();

  Widget onExitDialog(){
    return myDialog(
      width: MyStyle.mediaQueryWidth(context, 0.96),
      height: MyStyle.mediaQueryHeight(context, 0.4),
      hasCancel: true,
      hasButton: true,
      buttonText: "بله مطمئنم",
      hasHeader: false,
      context: context,
      onButtonPressed: () async {
        await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      content: const Align(
        alignment: Alignment.center,
        child: Text("آیا میخواهید از حساب کاربری خود خارج شوید؟" , textAlign:TextAlign.center,
          style: TextStyle(
            fontSize: MyStyle.S18,
            color: MyStyle.lightGrayText,
            fontFamily: MyStyle.textBoldFont
        ),),
      ),


    );
  }

  Widget onEditDialog(){
    _txtName.text = AppConstants.BUYER_NAME;
    ///TODO
    return myDialog(
      width: MyStyle.mediaQueryWidth(context, 0.96),
      height: MyStyle.mediaQueryHeight(context, 0.7),
      hasCancel: true,
      hasButton: true,
      buttonText: "ویرایش",
      hasHeader: true,
      headerText: "ویرایش اطلاعات",
      context: context,
      onButtonPressed: (){print("Comment saved");},
      content: Column(
        children: [
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.end,
            hint: "نام و نام خانوادگی",
            keyboardType: TextInputType.text,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(30),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtName,
            focusNode: _fndName,
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.end,
            hint: "آدرس",
            keyboardType: TextInputType.text,
            maxLine: 4,
            fontSize: MyStyle.S13,
            minLine: 4,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(120),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtAddress,
            focusNode: _fndAddress,
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.end,
            hint: "کد پستی",
            keyboardType: TextInputType.text,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(30),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtPostalCode,
            focusNode: _fndPostalCode,
          )
        ],
      ),


    );
  }

  @override
  Widget build(BuildContext c) {

    favorites = [
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/5.jpg','assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: true,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: false,
          category: "پوشاک",
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: true,
          star: 4.5,
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: true,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: true,
          category: "پوشاک",
          star: 4.5,
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/5.jpg'],
          isRemovable: true,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          hasOnlineSell: true,
          category: "پوشاک",
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          isRemovable: true,
          star: 4.5,
          shopCode: "hfgds43"),
    ];

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
                                    InkWell(onTap:onExitDialog, child: SvgPicture.asset("assets/svg/exit.svg")),
                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                                    InkWell(onTap:onEditDialog, child: SvgPicture.asset("assets/svg/edit.svg"))
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("لیست سفارشات",style: MyStyle.redMediumHeaderStyle,),
                                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),
                                orderItemWidget(
                                  context: c,
                                  orderItem: OrderModel(
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
                                ///All orders
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                        context, MaterialPageRoute(builder: (context) =>   const AllBuyerOrders()));
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
                          ),

                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                          ///Favorites
                          favoriteVitrine(
                            context: context,
                            favorites: favorites
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
