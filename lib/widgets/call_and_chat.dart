import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'comment_slider_manually.dart';

//type : shop

Widget callAndChat({BuildContext context, String phoneNumber, String shopCode , String buyerCode , bool justChat = false }){
  return Container(
    height: MyStyle.mediaQueryHeight(context, 0.18),
    width: MyStyle.mediaQueryWidth(context, 0.16),
    decoration: BoxDecoration(
      color: MyStyle.headerDarkPink,
      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: MyStyle.mediaQueryWidth(context, 0.015),
        vertical: MyStyle.mediaQueryHeight(context, 0.015)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ///phone
        justChat ? Container() :InkWell(
          onTap: (){
            UrlLauncher.launch("tel://$phoneNumber");
          },
          child: SvgPicture.asset("assets/svg/phone.svg",
          width: MyStyle.mediaQueryWidth(context, 0.06),
            fit: BoxFit.fitWidth,
          ),
        ),

        justChat ? Container() :SizedBox(
          height: MyStyle.mediaQueryHeight(context, 0.03),
        ),

        ///chat
        InkWell(
          onTap: (){

          },
          child: SvgPicture.asset("assets/svg/chat.svg",
            width: MyStyle.mediaQueryWidth(context, 0.1),
            fit: BoxFit.fitWidth,
          ),
        ),

        justChat ? Padding(
          padding:  EdgeInsets.only(top:MyStyle.mediaQueryHeight(context, 0.02), ),
          child: const Text("گفت و گو با مشتریان" , maxLines: 3,textAlign: TextAlign.center, style: MyStyle.whiteLightTextStyle,),
        ): Container() ,

      ],
    ),
  );
}