import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class MyDrawer extends StatefulWidget {


  Widget content;
  String text;
  MyDrawer({Key key,this.content, this.text}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02)),
        height: MyStyle.mediaQueryHeight(context, 0.05),
        width: MyStyle.mediaQueryWidth(context, 0.4),
        decoration: const BoxDecoration(
          color: MyStyle.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/svg/bottom_arrow.svg',),


              Text( widget.text,
                  textAlign: TextAlign.end,
                  style: MyStyle.lightGrayTextStyle),
            ]
        ),
      ),
    );
  }
}