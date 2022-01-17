import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/buyers/profile/profile_buyer.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/radio_button.dart';
import 'package:mosallas/widgets/text_field.dart';

class OnlineShopPage extends StatefulWidget {

  final ProductModel product;
  const OnlineShopPage({Key key, this.product, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => OnlineShopPageState();
}

class OnlineShopPageState extends State<OnlineShopPage> {


  final TextEditingController _txtReceiver = TextEditingController(text: '');
  final FocusNode _fndReceiver = FocusNode();

  final TextEditingController _txtAddress = TextEditingController(text: '');
  final FocusNode _fndAddress = FocusNode();

  final TextEditingController _txtPostalCode = TextEditingController(text: '');
  final FocusNode _fndPostalCode = FocusNode();

  String shopName = "فروشگاه لباس مجلسی ایلگا";
  bool hasDifferentReceiver = false ;
  bool hasDifferentAddress = false ;
  int totalAmount = 0;

  @override
  Widget build(BuildContext c) {

    ShopVitrineModel shop =  ShopVitrineModel(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shippingCost: 12000,
        shopCode: "mnb876gi99",
        star: 4.3,
        phoneNumber: "09123456789",
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/6.jpg","assets/image/12.jpg"]
    );

    totalAmount = widget.product.cost+shop.shippingCost;

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
                  const GrayAppBar(
                    pageHeaderNameLarge: "ثبت سفارش" ,
                    pageHeaderNameSmall:"",
                  ),

                  Stack(
                    children: [
                      SizedBox(
                        //color:MyStyle.green,
                          height: MyStyle.mediaQueryHeight(context, 0.72),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [

                                  ///Image & Info
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(
                                      height:  MyStyle.mediaQueryWidth(context, 0.25),
                                      width: MyStyle.mediaQueryWidth(context, 0.25),
                                      padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.02)),
                                      decoration: BoxDecoration(
                                        color: MyStyle.white,
                                        borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                      ),
                                      child: Image.asset(widget.product.imagePath[0] ,
                                        width: MyStyle.mediaQueryWidth(context, 0.21),fit: BoxFit.fitWidth,),
                                    ),
                                    Container(
                                      height:  MyStyle.mediaQueryWidth(context, 0.25),
                                      width: MyStyle.mediaQueryWidth(context, 0.65),
                                      padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.02)),
                                      decoration: BoxDecoration(
                                        color: MyStyle.white,
                                        borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(width:MyStyle.mediaQueryWidth(context, 0.61),
                                              child: Text(widget.product.name , style: MyStyle.darkTextStyleS15, textAlign: TextAlign.end,maxLines: 3,overflow: TextOverflow.ellipsis,)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Text("تومان " , style: MyStyle.lightPinkTextStyleS13, textAlign: TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                  Text(widget.product.cost.toString() , style: MyStyle.lightPinkTextStyleS13, textAlign: TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                ],
                                              ),
                                              Text(widget.product.code , style: MyStyle.darkTextStyleS13, textAlign: TextAlign.end,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                          ],)
                                        ],
                                      )
                                    )
                                  ],),
                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),

                                  Container(
                                    padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
                                    decoration: BoxDecoration(
                                      color: MyStyle.white,
                                      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        const Text(":هزینه ی ارسال محصولات این فروشگاه" , style: MyStyle.darkTextStyleS13,textAlign: TextAlign.right,),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Container(
                                          height: MyStyle.mediaQueryHeight(context, 0.06),
                                          decoration: BoxDecoration(
                                            color: MyStyle.backgroundColor,
                                            borderRadius: BorderRadius.circular(MyStyle.borderRadius2),),
                                            padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                            child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text("تومان " , style: MyStyle.darkTextStyleS13,),
                                              Text(shop.shippingCost.toString() , style: MyStyle.darkTextStyleS13,),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),
                                        const Text(":جمع مبلغ" , style: MyStyle.darkTextStyleS13,textAlign: TextAlign.right,),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Container(
                                          height: MyStyle.mediaQueryHeight(context, 0.06),
                                          decoration: BoxDecoration(
                                            color: MyStyle.backgroundColor,
                                            borderRadius: BorderRadius.circular(MyStyle.borderRadius2),),
                                          padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text("تومان " , style: MyStyle.darkTextStyleS13,),
                                              Text(totalAmount.toString() , style: MyStyle.darkTextStyleS13,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                                  Container(
                                    padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
                                    decoration: BoxDecoration(
                                      color: MyStyle.white,
                                      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        const Text(":نام گیرنده را وارد کنید" , style: MyStyle.darkTextStyleS13,textAlign: TextAlign.right,),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: MyStyle.mediaQueryHeight(context, 0.06),
                                              width: MyStyle.mediaQueryWidth(context, 0.75),
                                              decoration: BoxDecoration(
                                                color: MyStyle.backgroundColor,
                                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),),
                                              padding: EdgeInsets.symmetric(
                                                vertical: MyStyle.mediaQueryHeight(context, 0.01),
                                                horizontal: MyStyle.mediaQueryWidth(context, 0.04)
                                              ),
                                              child: Align(alignment: Alignment.centerRight,
                                                  child: Text(shop.shippingCost.toString() , style: MyStyle.darkTextStyleS13,textAlign: TextAlign.end,)),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  hasDifferentReceiver = !hasDifferentReceiver;
                                                });
                                              },
                                              child: myRadioButton(context, value: !hasDifferentReceiver),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            MyTextField(
                                              hint: "نام گیرنده",
                                              textAlign: TextAlign.right,
                                              width: MyStyle.mediaQueryWidth(context, 0.75),
                                              height: MyStyle.mediaQueryHeight(context, 0.06),
                                              bgColor: MyStyle.backgroundColor,
                                              fontSize: MyStyle.S13,
                                              focusNode: _fndReceiver,
                                              controller: _txtReceiver,
                                              borderColor: MyStyle.backgroundColor,
                                              isGray: true,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  hasDifferentReceiver = !hasDifferentReceiver;
                                                });
                                              },
                                              child: myRadioButton(context, value: hasDifferentReceiver),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                                  Container(
                                    padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
                                    decoration: BoxDecoration(
                                      color: MyStyle.white,
                                      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        const Text(":لطفا آدرس را وارد کنید" , style: MyStyle.darkTextStyleS13,textAlign: TextAlign.right,),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              //height: MyStyle.mediaQueryHeight(context, 0.06),
                                              width: MyStyle.mediaQueryWidth(context, 0.75),
                                              decoration: BoxDecoration(
                                                color: MyStyle.backgroundColor,
                                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: MyStyle.mediaQueryHeight(context, 0.01),
                                                  horizontal: MyStyle.mediaQueryWidth(context, 0.04)
                                              ),
                                              child: const Align(alignment: Alignment.centerRight,
                                                  child: Text("زنجان، سلطانیه، خیابان پاسداران، نبش کوچه ی حکمت، پلاک 82 . کد پستی : 123456789" ,
                                                    style: MyStyle.darkTextStyleS13,textAlign: TextAlign.end,)),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  hasDifferentAddress = !hasDifferentAddress;
                                                });
                                              },
                                              child: myRadioButton(context, value: !hasDifferentAddress),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    MyDrawer(text: "شهرستان",attribute:"BUYER_CITY", isGray: true,
                                                      content: const ["زنجان" , "سلطانیه" ,  "ابهر" ,  "خرمدره" , " ماهنشان" , "ایجرود","قیدار" , " هیدج" , "صائین قلعه"],),
                                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.03),),
                                                    MyDrawer(text: "استان",attribute:"BUYER_PROVINCE", isGray: true,
                                                      content: const ["زنجان" , "تهران" ,  "مشهد" ,  "قزوین" , " اردبیل" , "اصفهان"],),
                                                  ],
                                                ),
                                                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),

                                                MyTextField(
                                                  hint: "کد پستی",
                                                  textAlign: TextAlign.right,
                                                  width: MyStyle.mediaQueryWidth(context, 0.75),
                                                  height: MyStyle.mediaQueryHeight(context, 0.06),
                                                  bgColor: MyStyle.backgroundColor,
                                                  fontSize: MyStyle.S13,
                                                  focusNode: _fndPostalCode,
                                                  controller: _txtPostalCode,
                                                  borderColor: MyStyle.backgroundColor,
                                                  isGray: true,
                                                ),

                                                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),

                                                MyTextField(
                                                  hint: "...آدرس را وارد کنید",
                                                  textAlign: TextAlign.right,
                                                  width: MyStyle.mediaQueryWidth(context, 0.75),
                                                  height: MyStyle.mediaQueryHeight(context, 0.18),
                                                  bgColor: MyStyle.backgroundColor,
                                                  fontSize: MyStyle.S13,
                                                  minLine: 4,
                                                  maxLine: 4,
                                                  focusNode: _fndAddress,
                                                  controller: _txtAddress,
                                                  borderColor: MyStyle.backgroundColor,
                                                  isGray: true,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  hasDifferentAddress = !hasDifferentAddress;
                                                });
                                              },
                                              child: myRadioButton(context, value: hasDifferentAddress),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.1),),

                                ],
                              ),
                            ),
                          )
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: MyStyle.mediaQueryHeight(context, 0.08),
                          width: MyStyle.mediaQueryWidth(context, 1),
                          decoration: const BoxDecoration(
                            color: MyStyle.lightGrayText,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(MyStyle.borderRadius4),
                              topLeft: Radius.circular(MyStyle.borderRadius4),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              top:MyStyle.mediaQueryHeight(context, 0.01),
                              bottom: MyStyle.mediaQueryHeight(context, 0.01),
                              left:MyStyle.mediaQueryWidth(context, 0.06),
                              right: MyStyle.mediaQueryWidth(context, 0.06)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: AppConstants.BALANCE>=totalAmount ? (){
                                  setState(() async {
                                    AppConstants.BALANCE = AppConstants.BALANCE - totalAmount;
                                    MyStyle.successfulSnackBar(".خرید شما با موفقیت انجام شد", context);
                                    ///TODO
                                    await Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => const BuyerProfile()));

                                  });
                                }:(){},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: MyStyle.mediaQueryHeight(context, 0.045),
                                  width: MyStyle.mediaQueryWidth(context, 0.35),
                                  decoration: const BoxDecoration(
                                    color: MyStyle.headerDarkPink,
                                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius4),),
                                  ),
                                  child: Text(AppConstants.BALANCE>=totalAmount ?
                                  "خرید با کیف پول":"موجودی کافی نیست",
                                  style: MyStyle.whiteLightTextStyle,),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "تومان "  ,
                                    style: MyStyle.whiteWalletAmountStyle,
                                  ),
                                  Text(
                                    AppConstants.BALANCE.toString()  ,
                                    style: MyStyle.whiteWalletAmountStyle,
                                  ),
                                  SizedBox(width: MyStyle.mediaQueryWidth(context, 0.03)),
                                  SvgPicture.asset('assets/svg/wallet.svg',
                                      height: MyStyle.mediaQueryHeight(context, 0.04), color: MyStyle.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: BuyerBottomNavBar(
                index: 2,
              ),
            )));
  }
}
