import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'comment_slider_manually.dart';

//type : shop

Widget emptyPhoto({BuildContext context,  double w , double h }){
  return Container(
    height: h ?? MyStyle.mediaQueryHeight(context, 0.18),
    width: w ?? MyStyle.mediaQueryWidth(context, 0.16),
    decoration: BoxDecoration(
      color: MyStyle.backgroundColor,
      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
    ),
    child: DottedBorder(
      color: MyStyle.darkGrayText,
      gap: 3,
      strokeWidth: 1,
      child: Container(

        padding: EdgeInsets.symmetric(
            horizontal: MyStyle.mediaQueryWidth(context, 0.015),
            vertical: MyStyle.mediaQueryHeight(context, 0.015)),
        child: Center(child: SvgPicture.asset("assets/svg/camera.svg",)),
      ),
    ),
  );
}