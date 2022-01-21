import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/buyers/home/home.dart';
import 'package:mosallas/pages/all_orders.dart';
import 'package:mosallas/pages/buyers/profile/profile_buyer.dart';
import 'package:mosallas/pages/buyers/shops/all_products.dart';
import 'package:mosallas/pages/buyers/shops/city_shops.dart';
import 'package:mosallas/pages/shop/profile/shop_profile.dart';
import 'package:mosallas/pages/shop/shop_home.dart';
import 'package:mosallas/pages/wallet.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';


class ShopBottomNavBar extends StatefulWidget {
  final int index;
  const ShopBottomNavBar({Key key, this.index}) : super(key: key);

  @override
  State<ShopBottomNavBar> createState() => _ShopBottomNavBarState();
}

class _ShopBottomNavBarState extends State<ShopBottomNavBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
      height: MyStyle.mediaQueryHeight(context, 0.1),
      decoration: BoxDecoration(
        color: MyStyle.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 3), // changes position of shadow
          ),
        ],
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
                    pageBuilder: (context, animation1, animation2) => const ShopHome(),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
          ),
          navBarItem(
              isEnable: (widget.index == 1) ? true : false ,
              name: "سفارشات",
              svgName: "menu",
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const AllBuyerOrders(isForShop: true,),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
          ),
          navBarItem(
              isEnable: (widget.index == 2) ? true : false ,
              name: "محصولات",
              svgName: "add",
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => AllProducts(
                      shopCode: AppConstants.SHOP_CODE,
                      isShop: true,
                      isFavorite: false,
                      isBuyer: false,
                    ),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
          ),
          navBarItem(
              isEnable: (widget.index == 3) ? true : false ,
              name: "کیف پول",
              svgName: "wallet",
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const BuyerWallet(isForShop: true,),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
          ),
          navBarItem(
              isEnable: (widget.index == 4) ? true : false ,
              name: "پروفایل",
              svgName: "profile",
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>  const ShopProfile(),
                    transitionDuration: Duration.zero,
                  ),
                );
              }
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
              height: MyStyle.mediaQueryHeight(context, svgName== "menu" ? 0.01:0.007),
            ),
            SvgPicture.asset(
              'assets/svg/$svgName.svg',
              color : isEnable ? MyStyle.headerDarkPink : MyStyle.lightGrayText,
              height: MyStyle.mediaQueryHeight(context, svgName== "menu" ? 0.025:0.035),
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, svgName== "menu" ? 0.017:0.01),
            ),
            Text(name , style: isEnable ?  MyStyle.lightPinkTextStyleS13 : MyStyle.lightGrayTextStyleS13 ,),

          ],
        ),
      ),
    );
  }
}
