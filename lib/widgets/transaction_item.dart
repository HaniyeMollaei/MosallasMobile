import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/models/transaction_model.dart';
import 'package:mosallas/utils/my_style.dart';

Widget transactionItem(BuildContext context, TransactionModel transaction ) {
  return  InkWell(
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
              children:  [
                Text("${transaction.type == "DEPOSIT"? "+":
                transaction.type == "WITHDRAWAL"? "-" :
                transaction.type == "TRANSFER_TO"? "-" :
                transaction.type == "TRANSFER_FROM"? "+" :
                " "} ${transaction.amount.toString()}",
                    style:TextStyle(
                      fontFamily: MyStyle.textLightFont,
                      color: transaction.type == "DEPOSIT"? MyStyle.green:
                      transaction.type == "WITHDRAWAL"? MyStyle.red :
                      transaction.type == "TRANSFER_TO"? MyStyle.red :
                      transaction.type == "TRANSFER_FROM"? MyStyle.green :
                      MyStyle.lightGrayText,
                      fontSize: MyStyle.S13,
                    )
                ),
                Text(transaction.date,
                    style:TextStyle(
                      fontFamily: MyStyle.textLightFont,
                      color: MyStyle.lightGrayText,
                      fontSize: MyStyle.S13,
                    )
                ),
              ],
            ),
            Text(transaction.type == "DEPOSIT"? "شارژ":
            transaction.type == "WITHDRAWAL"? "برداشت" :
            transaction.type == "TRANSFER_TO"? "انتقال به" :
            transaction.type == "TRANSFER_FROM"? "انتقال از" :
            "_",
                style:TextStyle(
                  fontFamily: MyStyle.textBoldFont,
                  color: MyStyle.darkGrayText,
                  fontSize: MyStyle.S17,
                )
            )
          ],
        )
    ),
  );

}
