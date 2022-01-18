import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/radio_button.dart';
import 'package:mosallas/widgets/snackbar.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

class BuyerWallet extends StatefulWidget {
  const BuyerWallet({Key key, this.isForShop = false}) : super(key: key);
  final bool isForShop;
  @override
  State<StatefulWidget> createState() => BuyerWalletState();
}

class BuyerWalletState extends State<BuyerWallet> {
  bool isDeposit = true;
  bool isWithdrawal = false;

  final TextEditingController _txtAmount = TextEditingController(text: '');
  final FocusNode _fndAmount = FocusNode();

  final TextEditingController _txtCardNumber = TextEditingController(text: '');
  final FocusNode _fndCardNumber = FocusNode();

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
                      ///Logo --> 1.8
                      const MediumLogo(
                        finalType: "location",
                      ),

                      ///text
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                        child: const Text(
                          ".نوع تراکنش را انتخاب کنید",
                          style: MyStyle.darkTextStyleS13,
                        ),
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.01),
                      ),

                      /// deposit - withdrawal
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: MyStyle.mediaQueryWidth(context, 0.44),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "برداشت از کیف پول",
                                      style: MyStyle.darkTextStyleS13,
                                    ),
                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isWithdrawal = !isWithdrawal;
                                          isDeposit = !isDeposit;
                                        });
                                      },
                                      child: myRadioButton(context, value: isWithdrawal),
                                    )
                                  ],
                                )),
                            SizedBox(
                                width: MyStyle.mediaQueryWidth(context, 0.44),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "شارژ کیف پول",
                                      style: MyStyle.darkTextStyleS13,
                                    ),
                                    SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isWithdrawal = !isWithdrawal;
                                          isDeposit = !isDeposit;
                                        });
                                      },
                                      child: myRadioButton(context, value: isDeposit),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.025),
                      ),

                      ///text
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                        child: const Text(
                          ".مبلغ مورد نظر را وارد کنید",
                          style: MyStyle.darkTextStyleS13,
                        ),
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.01),
                      ),

                      ///amount 0.08
                      MyTextField(
                        controller: _txtAmount,
                        focusNode: _fndAmount,
                        hint: "مبلغ (تومان)",
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(12),
                        ],
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.025),
                      ),

                      ///text
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                        child: const Text(
                          ".شماره ی کارت را وارد کنید",
                          style: MyStyle.darkTextStyleS13,
                        ),
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.01),
                      ),

                      ///card 0.08
                      MyTextField(
                        controller: _txtCardNumber,
                        focusNode: _fndCardNumber,
                        hint: "_ _ _ _  _ _ _ _  _ _ _ _  _ _ _ _",
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          MyStyle.cardNumberFormatter,
                          LengthLimitingTextInputFormatter(19),
                        ],
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.01),
                      ),

                      ///Login Button 0.08
                      SubmitButton(
                        text: "انجام عملیات",
                        textSize: MyStyle.S17,
                        onPressed: () async {
                          if(isDeposit){
                            setState(() {
                              AppConstants.BALANCE = AppConstants.BALANCE + int.parse(_txtAmount.text);
                            });
                          }else if(isWithdrawal){
                            if(int.parse(_txtAmount.text)<= AppConstants.BALANCE){
                              setState(() {
                                AppConstants.BALANCE = AppConstants.BALANCE - int.parse(_txtAmount.text);
                              });
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar(
                                  ".مبلغ وارد شده از موجودی بیشتر می باشد",
                                  0,
                                  context));
                            }
                          }
                        },
                        isDisable: false,
                      ),

                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.025),
                      ),

                      Container(
                        height: MyStyle.mediaQueryHeight(context, 0.285),
                        decoration: const BoxDecoration(
                          color: MyStyle.lightGrayText,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(MyStyle.borderRadius4),
                            topLeft: Radius.circular(MyStyle.borderRadius4),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top:MyStyle.mediaQueryHeight(context, 0.015),
                          bottom: MyStyle.mediaQueryHeight(context, 0.01),
                          left:MyStyle.mediaQueryWidth(context, 0.06),
                          right: MyStyle.mediaQueryWidth(context, 0.06)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "تومان "  ,
                                  style: MyStyle.whiteWalletAmountStyle,
                                ),
                                Text(
                                  AppConstants.BALANCE.toString()  ,
                                  style: MyStyle.whiteWalletAmountStyle,
                                ),
                                SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02)),
                                SvgPicture.asset('assets/svg/wallet.svg',
                                    height: MyStyle.mediaQueryHeight(context, 0.04), color: MyStyle.white),
                              ],
                            ),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.01),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  height: MyStyle.mediaQueryHeight(context, 0.07),
                                  decoration: const BoxDecoration(
                                    color: MyStyle.white,
                                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius2),),
                                  ),
                                  padding: EdgeInsets.only(
                                      top:MyStyle.mediaQueryHeight(context, 0.005),
                                      bottom: MyStyle.mediaQueryHeight(context, 0.005),
                                      left:MyStyle.mediaQueryWidth(context, 0.06),
                                      right: MyStyle.mediaQueryWidth(context, 0.06)
                                  ),
                                  margin: EdgeInsets.only(
                                    top:MyStyle.mediaQueryHeight(context, 0.005),
                                    bottom: MyStyle.mediaQueryHeight(context, 0.005),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                        Text("+2,000",
                                            style:TextStyle(
                                              fontFamily: MyStyle.textLightFont,
                                              color: MyStyle.green,
                                              fontSize: MyStyle.S13,
                                            )
                                        ),
                                          Text("1400/10/19",
                                              style:TextStyle(
                                                fontFamily: MyStyle.textLightFont,
                                                color: MyStyle.lightGrayText,
                                                fontSize: MyStyle.S13,
                                              )
                                          ),
                                      ],
                                      ),
                                      const Text("شارژ",
                                        style:TextStyle(
                                          fontFamily: MyStyle.textBoldFont,
                                          color: MyStyle.darkGrayText,
                                          fontSize: MyStyle.S17,
                                        )
                                      )
                                    ],
                                  )
                              ),
                            ),

                            InkWell(
                              onTap: (){},
                              child: Container(
                                  height: MyStyle.mediaQueryHeight(context, 0.07),
                                  decoration: const BoxDecoration(
                                    color: MyStyle.white,
                                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius2),),
                                  ),
                                  padding: EdgeInsets.only(
                                      top:MyStyle.mediaQueryHeight(context, 0.005),
                                      bottom: MyStyle.mediaQueryHeight(context, 0.005),
                                      left:MyStyle.mediaQueryWidth(context, 0.06),
                                      right: MyStyle.mediaQueryWidth(context, 0.06)
                                  ),
                                  margin: EdgeInsets.only(
                                    top:MyStyle.mediaQueryHeight(context, 0.005),
                                    bottom: MyStyle.mediaQueryHeight(context, 0.005),
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text("-1,000",
                                              style:TextStyle(
                                                fontFamily: MyStyle.textLightFont,
                                                color: MyStyle.red,
                                                fontSize: MyStyle.S13,
                                              )
                                          ),
                                          Text("1400/10/19",
                                              style:TextStyle(
                                                fontFamily: MyStyle.textLightFont,
                                                color: MyStyle.lightGrayText,
                                                fontSize: MyStyle.S13,
                                              )
                                          ),
                                        ],
                                      ),
                                      const Text("برداشت",
                                          style:TextStyle(
                                            fontFamily: MyStyle.textBoldFont,
                                            color: MyStyle.darkGrayText,
                                            fontSize: MyStyle.S17,
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),


                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.01),
                            ),

                            const InkWell(
                                child:Text("مشاهده ی کامل گردش حساب" , style:MyStyle.lightTextStyle)
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                ]),
              ),
              bottomNavigationBar: widget.isForShop ?
              const ShopBottomNavBar(
                index: 3,
              ):
              BuyerBottomNavBar(
                index: 1,
              ),
            )));
  }
}
