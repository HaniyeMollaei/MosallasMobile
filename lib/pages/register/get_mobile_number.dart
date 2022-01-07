import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/register/verification_code.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';
import 'package:mosallas/widgets/large_logo.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/register_shops_and_buyers.dart';
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
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RegisterShopAndBuyers(type: AppConstants.USER_TYPE,),
                        ),
                      ),

                      ///Logo --> 0.3
                      const LargeLogo(),

                      ///enter mobile number text  0.035
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                        child: SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.035),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(".شماره موبایل خود را وارد کنید",
                                style: MyStyle.lightGrayTextStyle),
                          ),
                        ),
                      ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.02),
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
                        height: MyStyle.mediaQueryHeight(context, 0.04),
                      ),



                      ///Login Button 0.08
                      SubmitButton(text: "ارسال کد",
                        onPressed: () async {
                          AppConstants.setConstant(attribute: "MOBILE_NUMBER", choosedValue: _txtMobileNumber.text.replaceAll(" ", ""));
                          await StorageUtil.setDataInSP("MOBILE_NUMBER", _txtMobileNumber.text.replaceAll(" ", ""));
                          AppConstants.getAllConstants();
                          await Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const VerificationPage()));
                        },
                        isDisable: false,
                      ),
                    ],
                  ),

                  ///1 - 0.79 = 0.21
                  LoginRegisterBottom(text:"ورود به حساب کاربری",onPressed: () async {
                    await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },)
                ]),
          ),
        ))) ;
  }

}