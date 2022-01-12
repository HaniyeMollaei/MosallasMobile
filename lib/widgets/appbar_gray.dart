import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class GrayAppBar extends StatefulWidget {
  final String pageHeaderNameSmall;
  final String pageHeaderNameLarge;
  final Widget leftIcon;
  final Function onIconClick;
  const GrayAppBar({Key key, this.pageHeaderNameLarge, this.pageHeaderNameSmall, this.leftIcon, this.onIconClick})
      : super(key: key);

  @override
  State<GrayAppBar> createState() => _GrayAppBarState();
}

class _GrayAppBarState extends State<GrayAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height = 0.15
      height: MyStyle.mediaQueryHeight(context, 0.09),
      width: MyStyle.mediaQueryWidth(context, 1),
      margin: EdgeInsets.only(
        left: MyStyle.mediaQueryWidth(context, 0.04),
        right: MyStyle.mediaQueryWidth(context, 0.04),
        top: MyStyle.mediaQueryHeight(context, 0.06),
        bottom: MyStyle.mediaQueryHeight(context, 0.03),
      ),
      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04), vertical: MyStyle.mediaQueryHeight(context, 0.01)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius3)),
        color: MyStyle.lightGrayText,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.09),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               InkWell(
                 child: widget.leftIcon ?? SvgPicture.asset('assets/svg/backward.svg', height: MyStyle.mediaQueryHeight(context, 0.03), fit: BoxFit.fitHeight, color: MyStyle.white),
                 onTap: widget.onIconClick?? () {
                   Navigator.of(context).pop();
                 },
               ),

                SvgPicture.asset('assets/svg/logo.svg', height: MyStyle.mediaQueryHeight(context, 0.06)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.pageHeaderNameSmall,
                  style: MyStyle.whiteLightTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                Text(
                  widget.pageHeaderNameLarge,
                  textAlign: TextAlign.center,
                  style: MyStyle.whiteWalletAmountStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
