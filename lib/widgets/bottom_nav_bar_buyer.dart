import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/state_management/bottom_sheet_listview_provider.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';
import 'package:mosallas/widgets/bottom_sheet.dart';
import 'package:mosallas/widgets/bottom_sheet_list_item.dart';
import 'package:provider/provider.dart';

class BuyerBottomNavBar extends StatefulWidget {
  int index;
  BuyerBottomNavBar({Key key, this.index}) : super(key: key);

  @override
  State<BuyerBottomNavBar> createState() => _BuyerBottomNavBarState();
}

class _BuyerBottomNavBarState extends State<BuyerBottomNavBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
      height: MyStyle.mediaQueryHeight(context, 0.1),
      decoration: const BoxDecoration(
        color: MyStyle.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navBarItem(isEnable: (widget.index == 0) ? true : false ,
            name: "خانه",
            svgName: ""
          )
        ],
      ),
    );
  }

  Widget navBarItem({Function onPressed , String svgName , String name , bool isEnable}){
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: MyStyle.mediaQueryHeight(context, 0.08),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/$svgName.svg',
              color : isEnable ? MyStyle.headerDarkPink : MyStyle.lightGrayText,
              height: MyStyle.mediaQueryHeight(context, 0.05),
            ),
            Text(name , style: isEnable ?  MyStyle.lightPinkTextStyle : MyStyle.lightGrayTextStyle ,)
          ],
        ),
      ),
    );
  }
}
