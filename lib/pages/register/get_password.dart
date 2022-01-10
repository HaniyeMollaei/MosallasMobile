import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/state_management/timer_provider.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/count_down_timer.dart';
import 'package:mosallas/widgets/logo_large.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/register_shops_and_buyers.dart';
import 'package:mosallas/widgets/snackbar.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';
import 'package:provider/provider.dart';

import 'get_name.dart';
import 'get_national_code.dart';

class GetPasswordPage extends StatefulWidget{
  const GetPasswordPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetPasswordPageState();

}

class GetPasswordPageState extends State<GetPasswordPage>{

  final TextEditingController _txtPassword = TextEditingController(text: '');
  final FocusNode _fndPassword = FocusNode();
  final TextEditingController _txtRePassword = TextEditingController(text: '');
  final FocusNode _fndRePassword = FocusNode();


  @override
  void initState() {
    super.initState();

  }


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
                            controller: _txtPassword,
                            focusNode: _fndPassword,
                            hint: "رمز عبور" ,
                            isEnable: false,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center ,
                            inputFormatters:  <TextInputFormatter>[
                              MyStyle.mobileNumberFormatter,
                              LengthLimitingTextInputFormatter(
                                  8),
                            ],
                          ),

                          ///0.01
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.01),
                          ),

                          ///Password 0.08
                          MyTextField(
                            controller: _txtRePassword,
                            focusNode: _fndRePassword,
                            hint: "تکرار رمز عبور" ,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center ,
                            inputFormatters:  <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(
                                  8),
                            ],
                          ),


                          ///0.04
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.04),
                          ),

                          ///Login Button 0.08
                          SubmitButton(text:AppConstants.USER_TYPE=="normal"?"ثبت نام" : "ادامه",
                            onPressed: () async {

                            ///TODO
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const GetNationalCodePage()));
                              },
                            isDisable: false,
                          ),
                        ],
                      ),

                      ///1 - 0.79 = 0.21
                      LoginRegisterBottom(text:"ورود به حساب کاربری",onPressed: () async {
                        await Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        print("Go To Login");                  },)
                    ]),
              ),
            ))) ;
  }

}