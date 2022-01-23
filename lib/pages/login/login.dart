import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/pages/buyers/home/home.dart';
import 'package:mosallas/pages/chat_list.dart';
import 'package:mosallas/pages/register/get_mobile_number.dart';
import 'package:mosallas/pages/shop/shop_home.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';
import 'package:mosallas/widgets/logo_large.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage>{

  final TextEditingController _txtMobileNumber = TextEditingController(text: '');
  final FocusNode _fndMobileNumber = FocusNode();
  final TextEditingController _txtPassword = TextEditingController(text: '');
  final FocusNode _fndPassword = FocusNode();


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
                      const LargeLogo(),

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

                      ///Password 0.08
                      MyTextField(
                        controller: _txtPassword,
                        focusNode: _fndPassword,
                        hint: "رمز عبور" ,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center ,
                        inputFormatters:  <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(
                              8),
                        ],
                      ),

                      ///0.015
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.015),
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
                                     style: MyStyle.lightGrayTextStyleS13)),
                           ),
                         ),
                       ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.04),
                      ),

                      ///Login Button 0.08
                      SubmitButton(text: "ورود",
                        onPressed: () async {
                          if(_txtMobileNumber.text =="1"){
                            AppConstants.SHOP_CATEGORY="پوشاک";
                            AppConstants.SHOP_CITY="زنجان";
                            AppConstants.SHOP_PROVINCE="زنجان";
                            AppConstants.SHOP_NAME="فروشگاه لباس مجلسی ایلگا";
                            AppConstants.SHOP_CODE = "RELJ323";
                            AppConstants.SHOP_POSTAL_CODE = "12345466";
                            AppConstants.SHOP_ADDRESS = "خیابان سعدی وسط، نبش خیابان زینبیه، کوچه ی امید، پلاک 16" ;
                            AppConstants.USER_TYPE = "shop";
                            AppConstants.MOBILE_NUMBER = " 09124424805";
                            AppConstants.BALANCE = 500000 ;
                            AppConstants.getAllConstants();
                          }else{
                            AppConstants.USER_TYPE = "normal";
                            AppConstants.BUYER_CITY = "زنجان";
                            AppConstants.BUYER_PROVINCE = "زنجان";
                            AppConstants.BUYER_NAME = "هانیه ملائی";
                            AppConstants.BUYER_CODE = "9365936";
                            AppConstants.MOBILE_NUMBER = " 09124424805";
                            AppConstants.BALANCE = 500000 ;
                            AppConstants.getAllConstants();
                          }

                          await Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => (_txtMobileNumber.text =="1")? const ShopHome() :(_txtMobileNumber.text =="0")? const ChatList(isForAdmin: true,) : const BuyerHome() ));

                        },
                        isDisable: false,
                      ),
                    ],
                  ),

                  ///1 - 0.79 = 0.21
                  LoginRegisterBottom(text:"ساخت حساب کاربری",
                    onPressed: () async {
                    await StorageUtil.setDataInSP("UserType", "normal");
                    await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const GetPhoneNumberPage()));
                  },)
                ]),
          ),
        ))) ;
  }

}