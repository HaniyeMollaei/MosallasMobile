import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/models/transaction_model.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/transaction_item.dart';

class ShopTransactionsPage extends StatefulWidget {

  final String code;
  final bool isForShop;

  const ShopTransactionsPage({Key key, this.code, this.isForShop=false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShopTransactionsPageState();
}

class ShopTransactionsPageState extends State<ShopTransactionsPage> {

  String shopName = "فروشگاه لباس مجلسی ایلگا";

  List<TransactionModel> transactions = [
    TransactionModel(
      code: "1234ggh",
      date: "1400/11/01",
      type: "WITHDRAWAL",
      amount: 12000,
      destination: "1234123412341234",//card
      source: AppConstants.MOBILE_NUMBER,
    ),
    TransactionModel(
      code: "1234gfd",
      date: "1400/11/07",
      type: "DEPOSIT",
      amount: 16000,
      destination: AppConstants.MOBILE_NUMBER,
      source: "1234123412341234",//card,
    ),
    TransactionModel(
      code: "1243ggh",
      date: "1400/10/11",
      type: "TRANSFER_TO",
      amount: 65000,
      destination: "09124424805",//card
      source: AppConstants.MOBILE_NUMBER,
    ),
    TransactionModel(
      code: "1234gth",
      date: "1400/10/01",
      type: "TRANSFER_FROM",
      amount: 1000,
      destination: AppConstants.MOBILE_NUMBER,//card
      source:  "09124424805",
    ),
  ];
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
              body: Column(
                children: [
                  ///Logo --> 1.8
                  GrayAppBar(
                    pageHeaderNameSmall: "گزارشات مالی",
                    pageHeaderNameLarge: shopName,
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.82),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///0.72-0.37
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                            child: ListView.builder(
                                padding: const EdgeInsets.only(top: 0, bottom: 0),
                                shrinkWrap: true,
                                itemExtent: null,
                                physics: BouncingScrollPhysics(),
                                itemCount: transactions.length,
                                itemBuilder: (BuildContext c, int index) {
                                  return transactionItem(c, transactions[index]);
                                }),
                          ),

                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.1),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            )));
  }
}
