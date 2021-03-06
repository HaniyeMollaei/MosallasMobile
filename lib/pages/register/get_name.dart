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

class GetNamePage extends StatefulWidget{
  const GetNamePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetNamePageState();

}

class GetNamePageState extends State<GetNamePage>{

  final TextEditingController _txtMobileNumber = TextEditingController(text: '');
  final FocusNode _fndMobileNumber = FocusNode();

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
                            controller: _txtMobileNumber,
                            focusNode: _fndMobileNumber,
                            hint: "?????? ?? ?????? ????????????????" ,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center ,
                            inputFormatters:  <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(
                                  40),
                            ],
                          ),

                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.04),
                          ),

                          ///enter city  0.035
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                            child: SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.035),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    onTap: (){
                                      print("Forgot password");
                                    },
                                    child: const Text(".?????????????? ?????? ???? ???????????? ????????",
                                        style: MyStyle.lightGrayTextStyleS13)),
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
                                MyDrawer(text: "??????????????",attribute:"BUYER_CITY",
                                  content: const ["??????????" , "??????????????" ,  "????????" ,  "????????????" , " ??????????????" , "????????????","??????????" , " ????????" , "?????????? ????????"],),
                                MyDrawer(text: "??????????",attribute:"BUYER_PROVINCE",
                                  content: const ["??????????" , "??????????" ,  "????????" ,  "??????????" , " ????????????" , "????????????"],),
                              ],
                            ),
                          ),

                          ///0.04
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.04),
                          ),

                          ///Login Button 0.08
                          SubmitButton(text:"??????????",
                            onPressed: () async {
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const GetPasswordPage()));
                              },
                            isDisable: false,
                          ),
                        ],
                      ),

                      ///1 - 0.79 = 0.21
                      LoginRegisterBottom(text:"???????? ???? ???????? ????????????",onPressed: () async {
                        await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },)
                    ]),
              ),
            ))) ;
  }

}