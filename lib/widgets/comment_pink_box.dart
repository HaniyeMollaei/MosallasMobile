import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';

import 'comment_slider_manually.dart';

Widget commentPinkBox({BuildContext context, String type, Function routToCommentsPage, List cmList , bool hasSideWidget}){
  return Container(
    width: MyStyle.mediaQueryWidth(context, hasSideWidget? 0.74 : 0.92),
    decoration: BoxDecoration(
      color: MyStyle.headerDarkPink,
      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: MyStyle.mediaQueryWidth(context, 0.015),
        vertical: MyStyle.mediaQueryHeight(context, 0.015)),
    child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right: MyStyle.mediaQueryWidth(context, 0.02)),
            child: Text(
              type =="tourism"?
              "آخرین نظرات در مورد این جاذبه  ":"آخرین نظرات در مورد این فروشگاه  ",
              style: MyStyle.whiteLightTextStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ),
        SizedBox(
          height: MyStyle.mediaQueryHeight(context, 0.01),
        ),
        ManuallyControlledCommentSlider(
          hasSideWidget: hasSideWidget,
          items: cmList,
        ),
        SizedBox(
          height: MyStyle.mediaQueryHeight(context, 0.01),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: routToCommentsPage,
            child: const Text(
              "    همه ی نظرات",
              style: MyStyle.whiteLightTextStyle,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    ),
  );
}