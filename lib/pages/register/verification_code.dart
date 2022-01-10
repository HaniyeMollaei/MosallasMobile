import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/login/login.dart';
import 'package:mosallas/pages/register/get_password.dart';
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

class VerificationPage extends StatefulWidget{
  const VerificationPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VerificationPageState();

}

class VerificationPageState extends State<VerificationPage>{

  final TextEditingController _txtMobileNumber = TextEditingController(text: '');
  final FocusNode _fndMobileNumber = FocusNode();
  final TextEditingController _txtVerificationCode = TextEditingController(text: '');
  final FocusNode _fndVerificationCode = FocusNode();

  String _code = '';

  String mobileNumber = "۰۹۳۷۱۵۴۴۱۵۹";

  TimerProvider _timerProvider = new TimerProvider();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _timerProvider = Provider.of<TimerProvider>(context, listen: false);
    });
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
                        controller: _txtMobileNumber,
                        focusNode: _fndMobileNumber,
                        hint: mobileNumber ,
                        isEnable: false,
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
                        controller: _txtVerificationCode,
                        focusNode: _fndVerificationCode,
                        hint: "_ _ _ _ _ _" ,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center ,
                        inputFormatters:  <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(
                              6),
                        ],
                      ),

                      ///0.015
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.015),
                      ),

                      ///timer  0.035
                       Consumer<TimerProvider>(
                         builder: (_, __, ___) {
                           return Padding(
                             padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.09)),
                             child: SizedBox(
                               height: MyStyle.mediaQueryHeight(context, 0.035),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SvgPicture.asset('assets/svg/timer.svg'),
                                   SizedBox(
                                     width: MyStyle.mediaQueryWidth(context, 0.02),
                                   ),
                                   _timerProvider.hasTimerStopped
                                       ? GestureDetector(
                                     onTap: () async {
                                       bool connectedToInternet = await MyStyle.checkConnection();
                                       if (connectedToInternet) {
                                         setState(() {
                                           _timerProvider.setPassPressed(true);
                                           _timerProvider.setHasTimerStopped(false);
                                         });
                                       } else {
                                         setState(() {
                                           _timerProvider.setPassPressed(false);
                                           //hasTimerStopped = true;
                                         });
                                         ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar(
                                             ".ارتباط شما با اینترنت قطع شده است",
                                             0,
                                             context));
                                       }
                                     },
                                     child:  const Text("ارسال مجدد",
                                         style: MyStyle.lightGrayTextStyleS13),
                                   )
                                       : CountDownTimer(
                                     secondsRemaining:  _timerProvider.time,
                                     whenTimeExpires: () {
                                       setState(() {
                                         _timerProvider.setPassPressed(false);
                                         _timerProvider.setHasTimerStopped(true);
                                         _code = "";
                                       });
                                     },
                                     countDownTimerStyle:MyStyle.lightGrayTextStyleS13,
                                   ),
                                 ],
                               ),
                             ),
                           );
                         },

                       ),

                      ///0.04
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.04),
                      ),

                      ///Login Button 0.08
                      SubmitButton(text: "ادامه",
                        onPressed: () async {
                          await Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                          AppConstants.USER_TYPE=="normal"?
                              const GetNamePage():const GetPasswordPage()));
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