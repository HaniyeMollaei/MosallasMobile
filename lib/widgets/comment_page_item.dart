import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/comment_slider_manually.dart';

Widget commentPageItem(BuildContext context, CommentItem cm) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
      child: Container(
        width: MyStyle.mediaQueryWidth(context, 1),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius3)),
          color: MyStyle.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02) ,
            vertical: MyStyle.mediaQueryHeight(context, 0.01)
        ),
        margin: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02) ,
          vertical:  MyStyle.mediaQueryHeight(context, 0.01)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${cm.date}" , style: MyStyle.lightGrayTextStyleS11,),
                Text(": ${cm.author}" , style: MyStyle.darkTextStyle,),
              ],
            ),
            Text(cm.text , style: MyStyle.lightGrayTextStyleS11,maxLines: 2, textAlign: TextAlign.end,),
          ],
        ),
      ),
    );

}
