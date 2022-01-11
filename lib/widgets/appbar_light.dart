import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';

class MediumLogo extends StatefulWidget {
  final String finalType;
  const MediumLogo({Key key, this.finalType = "location"}) : super(key: key);

  @override
  State<MediumLogo> createState() => _MediumLogoState();
}

class _MediumLogoState extends State<MediumLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(//height = 0.15
      height: MyStyle.mediaQueryHeight(context, 0.06),
      width: MyStyle.mediaQueryWidth(context, 1),
      margin: EdgeInsets.only(
        left: MyStyle.mediaQueryWidth(context, 0.06),
        right: MyStyle.mediaQueryWidth(context, 0.06),
        top: MyStyle.mediaQueryHeight(context, 0.06),
        bottom: MyStyle.mediaQueryHeight(context, 0.03),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.finalType == "location"
              ? InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: MyStyle.mediaQueryHeight(context, 0.01)),
                        child: SvgPicture.asset('assets/svg/location.svg',
                            height: MyStyle.mediaQueryHeight(context, 0.03), color: MyStyle.headerDarkPink),
                      ),
                      SizedBox(
                        width: MyStyle.mediaQueryWidth(context, 0.02),
                      ),
                      Text(AppConstants.USER_TYPE == "normal" ? AppConstants.BUYER_CITY : AppConstants.SHOP_CITY,
                          style: MyStyle.lightPinkTextStyle)
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: MyStyle.mediaQueryHeight(context, 0.02)),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/svg/backward.svg',
                        height: MyStyle.mediaQueryHeight(context, 0.04), color: MyStyle.headerDarkPink),
                    onPressed: () {},
                  ),
                ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(" ${MyStyle.appName}   ", style: MyStyle.redMediumHeaderStyle),
              SizedBox(
                width: MyStyle.mediaQueryWidth(context, 0.01),
              ),
              SvgPicture.asset('assets/svg/logo.svg', height: MyStyle.mediaQueryHeight(context, 0.06)),
            ],
          ),
        ],
      ),
    );
  }
}
