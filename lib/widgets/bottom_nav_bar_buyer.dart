import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/buyers/home/home.dart';
import 'package:mosallas/pages/buyers/wallet/wallet_buyer.dart';
import 'package:mosallas/utils/my_style.dart';


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
      padding: EdgeInsets.symmetric( horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
      height: MyStyle.mediaQueryHeight(context, 0.1),
      decoration: const BoxDecoration(
        color: MyStyle.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navBarItem(
              isEnable: (widget.index == 0) ? true : false ,
            name: "خانه",
            svgName: "home",
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => BuyerHome(),
                  transitionDuration: Duration.zero,
                ),
              );
            }
          ),
          navBarItem(
              isEnable: (widget.index == 1) ? true : false ,
              name: "کیف پول",
              svgName: "wallet",
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => BuyerWallet(),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
          ),
          navBarItem(
              isEnable: (widget.index == 2) ? true : false ,
              name: "فروشگاه ها",
              svgName: "location",
              onPressed: (){}
          ),
          navBarItem(
              isEnable: (widget.index == 3) ? true : false ,
              name: "پروفایل",
              svgName: "profile",
              onPressed: (){}
          )
        ],
      ),
    );
  }

  Widget navBarItem({Function onPressed , String svgName , String name , bool isEnable}){
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: MyStyle.mediaQueryHeight(context, 0.09),
        child: Column(
          children: [
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.007),
            ),
            SvgPicture.asset(
              'assets/svg/$svgName.svg',
              color : isEnable ? MyStyle.headerDarkPink : MyStyle.lightGrayText,
              height: MyStyle.mediaQueryHeight(context, 0.035),
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.01),
            ),
            Text(name , style: isEnable ?  MyStyle.lightPinkTextStyle : MyStyle.lightGrayTextStyle ,),

          ],
        ),
      ),
    );
  }
}
