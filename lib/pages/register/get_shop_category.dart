import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/register/verification_code.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/logo_large.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/register_shops_and_buyers.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

import 'get_password.dart';

class GetShopCategoryPage extends StatefulWidget{
  const GetShopCategoryPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetShopCategoryPageState();

}

class GetShopCategoryPageState extends State<GetShopCategoryPage>{

  final TextEditingController _txtShopName = TextEditingController(text: '');
  final FocusNode _fndShopName = FocusNode();

  @override
  Widget build(BuildContext c) {
    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset : false,
              backgroundColor: MyStyle.backgroundColor,
              body: SizedBox(
                width: MyStyle.mediaQueryWidth(c, 1),
                height: MyStyle.mediaQueryHeight(c, 1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ///0.15
                      Column(
                        children: [
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: RegisterShopAndBuyers(type: AppConstants.USER_TYPE,),
                            ),
                          ),

                          ///Logo --> 0.3
                          const LargeLogo(),



                          ///telephone number 0.08
                          MyTextField(
                            controller: _txtShopName,
                            focusNode: _fndShopName,
                            hint: "نام فروشگاه" ,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center ,
                            inputFormatters:  <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(
                                  40),
                            ],
                          ),

                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),

                          ///enter city  0.035
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                            child: SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.035),
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(".شهرستان خود را انتخاب کنید",
                                    style: MyStyle.lightGrayTextStyleS13),
                              ),
                            ),
                          ),

                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.01),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyDrawer(text: "شهرستان",attribute:"SHOP_CITY",
                                  content: const ["زنجان" , "سلطانیه" ,  "ابهر" ,  "خرمدره" , " ماهنشان" , "ایجرود","قیدار" , " هیدج" , "صائین قلعه"],),
                                MyDrawer(text: "استان",attribute:"SHOP_PROVINCE",
                                  content: const ["زنجان" , "تهران" ,  "مشهد" ,  "قزوین" , " اردبیل" , "اصفهان"],),

                              ],
                            ),
                          ),
                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.02),
                          ),

                          ///enter category  0.035
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                            child: SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.035),
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(".دسته بندی محصولات خود را مشخص کنید",
                                    style: MyStyle.lightGrayTextStyleS13),
                              ),
                            ),
                          ),

                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.01),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                          child: MyDrawer(text: "دسته بندی",attribute: "SHOP_CATEGORY",
                            content:const ["پوشاک","لوازم خانگی","خوار و بار","پارچه فروشی","قطعات خودرو",] , )),
                          ),


                          ///0.04
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.04),
                          ),

                          ///Login Button 0.08
                          SubmitButton(text:"ثبت نام",
                            onPressed: () async {
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const GetPasswordPage()));
                              },
                            isDisable: false,
                          ),
                        ],
                      ),

                      ///1 - 0.79 = 0.21
                      LoginRegisterBottom(text:"ورود به حساب کاربری",onPressed: () async {
                        await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => LoginPage()));
                        print("Go To Login");
                      },)
                    ]),
              ),
            ))) ;
  }

}