import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/models/transaction_model.dart';
import 'package:mosallas/utils/my_style.dart';

import 'dialoug.dart';

Widget transactionItem(BuildContext context, TransactionModel transaction ) {
  return  InkWell(
    onTap: (){
      myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.96),
        height: MyStyle.mediaQueryHeight(context, 0.4),
        hasCancel: true,
        hasButton: false,
        cancelText: "بستن",
        hasHeader: false,
        context: context,
        content: Container(
          padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
          decoration: BoxDecoration(
            color: MyStyle.white,
            borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width:MyStyle.mediaQueryWidth(context, 0.8),
                child: Text(transaction.type == "DEPOSIT"? "شارژ":
                transaction.type == "WITHDRAWAL"? "برداشت" :
                transaction.type == "TRANSFER_TO"? "انتقال به" :
                transaction.type == "TRANSFER_FROM"? "انتقال از" :
                "_" ,
                  textAlign: TextAlign.center, style: TextStyle(
                      fontFamily: MyStyle.textMediumFont,
                      color: transaction.type == "DEPOSIT"? MyStyle.green:
                      transaction.type == "WITHDRAWAL"? MyStyle.red :
                      transaction.type == "TRANSFER_TO"? MyStyle.red :
                      transaction.type == "TRANSFER_FROM"? MyStyle.green :
                      MyStyle.lightGrayText,
                      fontSize: MyStyle.S17,
                    )),
              ),
              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text( transaction.amount.toString() ?? "_", style: MyStyle.lightGrayTextStyleS13,),

                  const Text( "مبلغ", style: MyStyle.lightGrayTextStyleS13,)
                ],),
              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text( transaction.source ?? "_", style: MyStyle.lightGrayTextStyleS13,),

                  const Text( "مبدا", style: MyStyle.lightGrayTextStyleS13,)
                ],),
              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text( transaction.destination ?? "_", style: MyStyle.lightGrayTextStyleS13,),

                  const Text( "مقصد", style: MyStyle.lightGrayTextStyleS13,)
                ],),
              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text( transaction.code ?? "_", style: MyStyle.lightGrayTextStyleS13,),
                  const Text( "شناسه ی تراکنش", style: MyStyle.lightGrayTextStyleS13,)
                ],),
              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text( transaction.date ?? "_", style: MyStyle.lightGrayTextStyleS13,),

                  const Text( "زمان", style: MyStyle.lightGrayTextStyleS13,)
                ],),

            ],
          ),
        ),


      );
      },
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
