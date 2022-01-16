import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/register/verification_code.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/logo_large.dart';
import 'package:mosallas/widgets/login_register_bottom.dart';
import 'package:mosallas/widgets/radio_button.dart';
import 'package:mosallas/widgets/register_shops_and_buyers.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

import 'get_shop_category.dart';

class GetGuildIdPage extends StatefulWidget {
  const GetGuildIdPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GetGuildIdPageState();
}

class GetGuildIdPageState extends State<GetGuildIdPage> {
  final TextEditingController _txtGuildId = TextEditingController(text: '');
  final FocusNode _fndGuildId = FocusNode();
  bool accepted = false;

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
              body: SizedBox(
                width: MyStyle.mediaQueryWidth(c, 1),
                height: MyStyle.mediaQueryHeight(c, 1),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  ///0.15
                  Column(
                    children: [
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: RegisterShopAndBuyers(
                            type: AppConstants.USER_TYPE,
                          ),
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
                            child: Text(".کد شناسه ی صنفی خود را وارد کنید", style: MyStyle.lightGrayTextStyleS13),
                          ),
                        ),
                      ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.02),
                      ),

                      ///national code 0.08
                      MyTextField(
                        controller: _txtGuildId,
                        focusNode: _fndGuildId,
                        hint: "_ _ _ _ _ _ _ _ _ _",
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.04),
                      ),

                      ///Login Button 0.08
                      SubmitButton(
                        text: "ادامه",
                        onPressed: () async {
                          await Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const GetShopCategoryPage()));
                        },
                        isDisable: false,
                      ),

                      ///0.02
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.02),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                        child: SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.035),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(".قوانین مطالعه و پذیرفته شد", style: MyStyle.lightGrayTextStyleS13),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      accepted = !accepted;
                                    });
                                  },
                                  child: myRadioButton(context, value: accepted),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///1 - 0.79 = 0.21
                  LoginRegisterBottom(
                    text: "ورود به حساب کاربری",
                    onPressed: () async {
                      await Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                  )
                ]),
              ),
            )));
  }
}
