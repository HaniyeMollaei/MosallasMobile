import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/register/verification_code.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/large_logo.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/register_shops_and_buyers.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

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
                            hint: "نام و نام خانوادگی" ,
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
                                    child: const Text(".شهرستان خود را انتخاب کنید",
                                        style: MyStyle.lightGrayTextStyle)),
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
                                MyDrawer(text: "شهرستان",content: Text("زنجان"),),
                                MyDrawer(text: "استان",content: Text("زنجان"),),

                              ],
                            ),
                          ),


                          ///0.04
                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.04),
                          ),

                          ///Login Button 0.08
                          SubmitButton(text: "ادامه",
                            onPressed: () async {
                              // await Navigator.push(
                              //     context, MaterialPageRoute(builder: (context) => VerificationPage()));
                              print("Logiiiiiiiiin");},
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