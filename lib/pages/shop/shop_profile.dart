import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/transactions_page.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/shop_profile_item.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';
import 'package:mosallas/widgets/text_field.dart';

import '../chat.dart';


class ShopProfile extends StatefulWidget {
  const ShopProfile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShopProfileState();
}

class ShopProfileState extends State<ShopProfile> {

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
      height: MyStyle.mediaQueryHeight(context, 0.3),
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


  ShopVitrineModel shop = ShopVitrineModel(
      shopName: "فروشگاه لباس مجلسی ایلگا",
      address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
      shopCode: "mnb876gi99",
      phoneNumber: "09123456789",
      shippingCost: 12000,
      star: 4.3,
      shopImagePath: "assets/image/ilga.jpg",
      productsImagePath: ["assets/image/6.jpg", "assets/image/12.jpg"]);


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
                    //padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                    height: MyStyle.mediaQueryHeight(context, 0.75),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          shopVitrine(context: c,shopVitrineItem: shop,justHeader: true),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),
                          shopProfileItem(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) =>
                                  ShopTransactionsPage(isForShop: true,code: AppConstants.SHOP_CODE,),
                                  transitionDuration: Duration.zero,
                                ),
                              );
                            },
                            text: "گردش مالی فروشگاه در ماه اخیر",
                            context: c
                          ),
                          shopProfileItem(
                              onTap: (){

                              },
                              text: "تبلیغات فروشگاه در شهرستان",
                              context: c
                          ),
                          shopProfileItem(
                              onTap: () async {

                                await Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) =>
                                        ChatPage(chat: ChatModel(
                                          //admin
                                            buyer: BuyerModelForChat(
                                              buyerName: "Admin",
                                              buyerProvince: "_",
                                              buyerCity: "_",
                                              mobileNo: "09908733108" ,
                                              userType: "admin",
                                              lastMessageSeen: false,
                                            ),
                                            shop: ShopModelForChat(
                                              userType: "shop",
                                              mobileNo: "09371544159",
                                              shopCode: "mbb5322",
                                              shopName: "فروشگاه لباس مجاسی ایلگا",
                                              lastMessageSeen: false,
                                              shopCity: "زنجان",
                                              shopProvince: "زنجان",
                                            ),
                                            chatCode: "cta12345",
                                            messages: [
                                              MessageModel(date: "1400/11/1",text: "سلام",sender: "normal"),
                                              MessageModel(date: "1400/11/1",text: "سلام.وقت به خیر",sender: "Shop"),
                                              MessageModel(date: "1400/11/1",text: "میخواستم سفارشمو پیگیری کنم",sender: "normal"),
                                              MessageModel(date: "1400/11/1",text: "کی ارسال میشه؟",sender: "normal"),
                                              MessageModel(date: "1400/11/1",text: "سفارشتون دیروز ارسال شده. احتمالا تا سه روز دیگه برسه دستتون.",sender: "shop"),
                                              MessageModel(date: "1400/11/1",text: "ممنون از اطلاعتون.",sender: "normal"),
                                              MessageModel(date: "1400/11/1",text: "میتونم کد پیگیری پست رو داشته باشم؟",sender: "normal"),
                                              MessageModel(date: "1400/11/1",text: "بله حتما",sender: "shop"),
                                              MessageModel(date: "1400/11/1",text: "123456789123456789123456",sender: "shop"),
                                              MessageModel(date: "1400/11/1",text: "متشکرم",sender: "normal"),
                                            ]
                                        ),isForShop: true,),
                                    transitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              text: "Admin ارتباط با",
                              context: c
                          ),
                          shopProfileItem(
                              onTap: (){},
                              text: "هزینه ی ارسال محصولات",
                              context: c
                          ),
                          shopProfileItem(
                              onTap: (){},
                              text: "گزارشات",
                              context: c,
                            isEnable: false,
                          ),
                          shopProfileItem(
                              onTap: (){},
                              text: "حذف حساب فروشگاه",
                              context: c,
                            isEnable: false,
                          ),
                          shopProfileItem(
                              onTap: onExitDialog,
                              text: "خروج از حساب کاربری",
                              context: c
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.1),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: const ShopBottomNavBar(
                index: 4,
              ),
            )));
  }
}
