import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/buyers/shops/shop_vitrine.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';


Widget favoriteVitrine(
    {BuildContext context,
      List<ProductModel> favorites}) {

  Widget header = Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: MyStyle.mediaQueryHeight(context, 0.1),
      width: MyStyle.mediaQueryWidth(context, 0.92),
      decoration: BoxDecoration(
        color: MyStyle.headerDarkPink,
        borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.02),
            ),
            const Text(
             "موارد مورد علاقه",
              style: MyStyle.whiteHeaderStyleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.01),
            ),
            InkWell(
              onTap: (){
                ///TODO
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("مشاهده ی همه ی موارد",style: MyStyle.whiteLightTextStyle,),
                  SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                  SvgPicture.asset("assets/svg/forward.svg" , color: MyStyle.white,),

                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );

  return InkWell(
    onTap: () async {
      // await Navigator.push(
      //     context, MaterialPageRoute(builder: (context) =>
      //     BuyerShopVitrine(shopCode: favorites.shopCode,shopHeader: header,)));
    },
    child: Stack(
        children: [
     ///products
     Center(
       child: Container(
         height: MyStyle.mediaQueryHeight(context, 0.3),
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
               child: (favorites != null )?
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Image.asset(favorites[0].imagePath[0],
                       width: MyStyle.mediaQueryWidth(context, 0.265),
                       //height: MyStyle.mediaQueryWidth(context, 0.28),
                       fit: BoxFit.fitWidth
                   ),
                   SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                   favorites.length >= 2 ?
                   Image.asset(favorites[1].imagePath[0],
                       width: MyStyle.mediaQueryWidth(context, 0.265),
                       // height: MyStyle.mediaQueryWidth(context, 0.28),
                       fit: BoxFit.fitWidth
                   ):Container(),
                   SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                   favorites.length >= 3 ?
                   Image.asset(favorites[2].imagePath[0],
                       width: MyStyle.mediaQueryWidth(context, 0.265),
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
  );
}
