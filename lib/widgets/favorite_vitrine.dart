import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/pages/buyers/shops/buyer_shop_vitrine.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';


Widget shopVitrine(
    {BuildContext context,
      ShopVitrineItem shopVitrineItem}) {

  Widget header = Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: MyStyle.mediaQueryHeight(context, 0.14),
      width: MyStyle.mediaQueryWidth(context, 0.92),
      decoration: BoxDecoration(
        color: MyStyle.headerDarkPink,
        borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: MyStyle.mediaQueryWidth(context, 0.46),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MyStyle.mediaQueryWidth(context, 0.015),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MyStyle.mediaQueryHeight(context, 0.01),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/svg/star.svg",
                        height: MyStyle.mediaQueryHeight(context, 0.02),
                        fit: BoxFit.fitHeight,
                        color: MyStyle.white),
                    Text(
                      "  ${shopVitrineItem.star.toString()}",
                      style: MyStyle.whiteLightTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: MyStyle.mediaQueryHeight(context, 0.005),
                ),
                Text(
                  shopVitrineItem.shopName,
                  maxLines: 2,
                  style: MyStyle.whiteWalletAmountStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MyStyle.mediaQueryHeight(context, 0.01),
                ),
                Text(
                  shopVitrineItem.address,
                  style: MyStyle.whiteLightTextStyle,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  return InkWell(
    onTap: () async {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
          BuyerShopVitrine(shopCode: shopVitrineItem.shopCode,shopHeader: header,)));
    },
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: MyStyle.mediaQueryWidth(context, 0.04), vertical: MyStyle.mediaQueryHeight(context, 0.01)),
      child: Stack(
        children: [
          ///products
          Center(
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.4),
              width: MyStyle.mediaQueryWidth(context, 0.92),
              decoration: BoxDecoration(
                color: MyStyle.white,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MyStyle.mediaQueryHeight(context, 0.22),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MyStyle.mediaQueryHeight(context, 0.01),
                      horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                    ),
                    child: (shopVitrineItem.productsImagePath != null )?
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(shopVitrineItem.productsImagePath[0],
                            width: MyStyle.mediaQueryWidth(context, 0.28),
                            //height: MyStyle.mediaQueryWidth(context, 0.28),
                            fit: BoxFit.fitWidth
                        ),
                        SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                        shopVitrineItem.productsImagePath.length >= 2 ?
                        Image.asset(shopVitrineItem.productsImagePath[1],
                            width: MyStyle.mediaQueryWidth(context, 0.28),
                            // height: MyStyle.mediaQueryWidth(context, 0.28),
                            fit: BoxFit.fitWidth
                        ):Container(),
                        SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                        shopVitrineItem.productsImagePath.length >= 3 ?
                        Image.asset(shopVitrineItem.productsImagePath[2],
                            width: MyStyle.mediaQueryWidth(context, 0.28),
                            //height: MyStyle.mediaQueryWidth(context, 0.28),
                            fit: BoxFit.fitWidth
                        ):Container(),
                      ],
                    ):Container(),
                  ),
                ),
              ),
            ),
          ),

          ///widget header
          header,
        ],
      ),
    ),
  );
}
