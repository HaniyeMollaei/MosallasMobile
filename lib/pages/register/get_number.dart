import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

class GetPhoneNumberPage extends StatefulWidget{
  const GetPhoneNumberPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetPhoneNumberPageState();

}

class GetPhoneNumberPageState extends State<GetPhoneNumberPage>{

  TextEditingController _txtMobileNumber = TextEditingController(text: '');
  FocusNode _fndMobileNumber = new FocusNode();

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
                      ),

                      ///Logo --> 0.3
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/logo.svg',
                              height: MyStyle.mediaQueryHeight(context, 0.18) ),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),
                            const Text(" ${MyStyle.appName}   ", style: MyStyle.redHeaderStyle),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),
                          ],
                        ),
                      ),

                      ///Forget Password  0.035
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
                                child: const Text("رمز عبور خود را فراموش کرده اید؟",
                                    style: MyStyle.lightGrayTextStyle)),
                          ),
                        ),
                      ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.04),
                      ),


                      ///telephone number 0.08
                      MyTextField(
                        controller: _txtMobileNumber,
                        focusNode: _fndMobileNumber,
                        hint: "۰۹ _ _  _ _ _  _ _ _ _" ,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center ,
                        inputFormatters:  <TextInputFormatter>[
                          MyStyle.mobileNumberFormatter,
                          LengthLimitingTextInputFormatter(
                              13),
                        ],
                      ),

                      ///0.01
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.01),
                      ),



                      ///Login Button 0.08
                      SubmitButton(text: "ارسال کد",
                        onPressed: (){print("Logiiiiiiiiin");},
                        isDisable: false,
                      ),
                    ],
                  ),

                  ///1 - 0.79 = 0.21
                  LoginRegisterBottom(text:"ورود به حساب کاربری",onPressed: (){
                    print("Go To Register");
                  },)
                ]),
          ),
        ))) ;
  }

}