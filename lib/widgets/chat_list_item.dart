import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/pages/chat.dart';
import 'package:mosallas/utils/my_style.dart';

Widget chatListItemForShop(BuildContext context, ChatModel chat ) {
  return InkWell(
    onTap: () async {
      await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>  ChatPage(chat: chat,isForShop: true,),
          transitionDuration: Duration.zero,
        ),
      );
    },
    child: Container(
      width: MyStyle.mediaQueryWidth(context, 1),
      height: MyStyle.mediaQueryHeight(context, 0.06),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius2)),
        color: MyStyle.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04) ,
          vertical: MyStyle.mediaQueryHeight(context, 0.01)
      ),
      margin: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02) ,
          vertical:  MyStyle.mediaQueryHeight(context, 0.01)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MyStyle.mediaQueryWidth(context, 0.02),
            height: MyStyle.mediaQueryWidth(context, 0.02),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(MyStyle.borderRadius2)),
              color: !chat.buyer.lastMessageSeen ? MyStyle.headerDarkPink : MyStyle.white,
            ),
          ),
          Text(chat.buyer.buyerName , style: MyStyle.lightGrayTextStyleS11,maxLines: 2, textAlign: TextAlign.end,),
        ],
      ),
    ),
  );

}
