import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class TourismSiteLeftImage extends StatefulWidget {
  final String siteName;
  final String description;
  final String imagePath;
  final Function onTap;

  const TourismSiteLeftImage({Key key, this.siteName, this.description, this.imagePath, this.onTap}) : super(key: key);

  @override
  State<TourismSiteLeftImage> createState() => _TourismSiteLeftImageState();
}

class _TourismSiteLeftImageState extends State<TourismSiteLeftImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MyStyle.mediaQueryWidth(context, 0.04),
        vertical: MyStyle.mediaQueryHeight(context, 0.01)
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.27),
              width: MyStyle.mediaQueryWidth(context, 0.92),
              decoration: BoxDecoration(
                color: MyStyle.headerDarkPink,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MyStyle.mediaQueryWidth(context, 0.02),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: MyStyle.mediaQueryHeight(context, 0.27),
            width: MyStyle.mediaQueryWidth(context, 0.88),
            decoration: BoxDecoration(
              color: MyStyle.lightGrayText,
              borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MyStyle.mediaQueryWidth(context, 0.02),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width:MyStyle.mediaQueryWidth(context, 0.88-0.5-0.04) ,
                child: Column(
                  children: [
                    SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),) ,
                    Text(widget.siteName , style: MyStyle.whiteWalletAmountStyle, textAlign: TextAlign.center,),
                    SizedBox(height: MyStyle.mediaQueryHeight(context, 0.015),) ,
                    Text(widget.description , style: MyStyle.whiteLightTextStyle,maxLines: 8, textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: MyStyle.mediaQueryHeight(context, 0.27),
            width: MyStyle.mediaQueryWidth(context, 0.5),
            decoration: BoxDecoration(
              color: MyStyle.white,
              borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MyStyle.mediaQueryWidth(context, 0.02),
            ),
            child: Center(
              child: Image.asset(widget.imagePath , height: MyStyle.mediaQueryHeight(context, 0.23),
                width: MyStyle.mediaQueryHeight(context, 0.23),fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}



class TourismSiteRightImage extends StatefulWidget {
  final String siteName;
  final String description;
  final String imagePath;
  final Function onTap;

  const TourismSiteRightImage({Key key, this.siteName, this.description, this.imagePath, this.onTap}) : super(key: key);

  @override
  State<TourismSiteRightImage> createState() => _TourismSiteRightImageState();
}

class _TourismSiteRightImageState extends State<TourismSiteRightImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MyStyle.mediaQueryWidth(context, 0.04),
          vertical: MyStyle.mediaQueryHeight(context, 0.01)
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.27),
              width: MyStyle.mediaQueryWidth(context, 0.92),
              decoration: BoxDecoration(
                color: MyStyle.headerDarkPink,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MyStyle.mediaQueryWidth(context, 0.02),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.27),
              width: MyStyle.mediaQueryWidth(context, 0.88),
              decoration: BoxDecoration(
                color: MyStyle.lightGrayText,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MyStyle.mediaQueryWidth(context, 0.02),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width:MyStyle.mediaQueryWidth(context, 0.88-0.5-0.04) ,
                  child: Column(
                    children: [
                      SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),) ,
                      Text(widget.siteName , style: MyStyle.whiteWalletAmountStyle, textAlign: TextAlign.center,),
                      SizedBox(height: MyStyle.mediaQueryHeight(context, 0.015),) ,
                      Text(widget.description , style: MyStyle.whiteLightTextStyle,maxLines: 8, textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.27),
              width: MyStyle.mediaQueryWidth(context, 0.5),
              decoration: BoxDecoration(
                color: MyStyle.white,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MyStyle.mediaQueryWidth(context, 0.02),
              ),
              child: Center(
                child: Image.asset(widget.imagePath , height: MyStyle.mediaQueryHeight(context, 0.23),
                  width: MyStyle.mediaQueryHeight(context, 0.23),fit: BoxFit.fill,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
