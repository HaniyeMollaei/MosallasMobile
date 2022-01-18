import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/text_field.dart';


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

                          Text("پروفایل"),

                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

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
