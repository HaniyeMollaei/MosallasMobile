import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';

Widget shopProfileItem({BuildContext context, String text, Function onTap}) {
  return InkWell(
    onTap: onTap ?? () {},
    child: Container(
      width: MyStyle.mediaQueryWidth(context, 1),
      height: MyStyle.mediaQueryHeight(context, 0.07),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius2)),
        color: MyStyle.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06) ,
          vertical: MyStyle.mediaQueryHeight(context, 0.01)
      ),
      margin: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04) ,
          vertical:  MyStyle.mediaQueryHeight(context, 0.01)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/svg/backward.svg" , color: MyStyle.lightGrayText,),

          Text(text , style: MyStyle.darkTextStyleS13,maxLines: 1, textAlign: TextAlign.end,),
        ],
      ),
    ),
  );

}
