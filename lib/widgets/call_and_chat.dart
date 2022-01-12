import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'comment_slider_manually.dart';

//type : shop

Widget callAndChat({BuildContext context, String phoneNumber, String shopCode }){
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
        
        InkWell(
          onTap: (){
            UrlLauncher.launch("tel://$phoneNumber");
          },
          child: SvgPicture.asset("assets/svg/phone.svg",
          width: MyStyle.mediaQueryWidth(context, 0.06),
            fit: BoxFit.fitWidth,
          ),
        ),
        
        SizedBox(
          height: MyStyle.mediaQueryHeight(context, 0.03),
        ),
        InkWell(
          onTap: (){

          },
          child: SvgPicture.asset("assets/svg/chat.svg",
            width: MyStyle.mediaQueryWidth(context, 0.1),
            fit: BoxFit.fitWidth,
          ),
        ),


      ],
    ),
  );
}