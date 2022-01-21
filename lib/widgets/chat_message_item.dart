import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/utils/my_style.dart';

Widget chatMessageItem(BuildContext context, MessageModel message ) {
  return Align(
    alignment:message.sender == "shop"? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      //width: MyStyle.mediaQueryWidth(context, 0.8),
      //height: MyStyle.mediaQueryHeight(context, 0.06),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(MyStyle.borderRadius2)),
        color: message.sender == "shop"? MyStyle.disableButtonColor: MyStyle.white ,
      ),
      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04) ,
          vertical: MyStyle.mediaQueryHeight(context, 0.01)
      ),
      margin: EdgeInsets.symmetric(
          vertical:  MyStyle.mediaQueryHeight(context, 0.01)
      ),
      child: Text(message.text , style: MyStyle.lightGrayTextStyleS11,maxLines: 2, textAlign: TextAlign.end,),
    ),
  );

}
