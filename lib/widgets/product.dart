import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/buyers/shops/buyer_product_page.dart';
import 'package:mosallas/utils/my_style.dart';


class ProductItem{
  String name;
  String code;
  String shopCode;
  int cost;
  List<String> imagePath;
  double star;
  bool isRemovable;
  bool hasOnlineSell;
  String category;
  ProductItem({this.name , this.hasOnlineSell , this.category , this.code , this.cost , this.imagePath , this.star , this.isRemovable , this.shopCode});
}

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key key, this.p, })
      : super(key: key);
  final ProductItem p;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyStyle.mediaQueryWidth(context, 0.015)),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => BuyerProductPage(product: widget.p,)));

        },
        child: SizedBox(
          width: MyStyle.mediaQueryWidth(context, 0.29),
          //height: MyStyle.mediaQueryHeight(context, 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MyStyle.mediaQueryHeight(context, 0.18),
                width: MyStyle.mediaQueryWidth(context, 0.29),
                decoration: BoxDecoration(
                  color: MyStyle.white,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                ),
                padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:MyStyle.mediaQueryHeight(context, 0.01),),
                    Image.asset(
                      widget.p.imagePath[0],
                      height: MyStyle.mediaQueryHeight(context, 0.12),
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/star.svg'),
                        Text(" ${widget.p.star.toString()}" , style: MyStyle.lightPinkTextStyleS13, maxLines: 3,)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: MyStyle.mediaQueryHeight(context, 0.12),
                width: MyStyle.mediaQueryWidth(context, 0.29),
                decoration: BoxDecoration(
                  color: MyStyle.white,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                ),
                padding: EdgeInsets.only(top: MyStyle.mediaQueryHeight(context, 0.01)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.p.name , style: MyStyle.darkTextStyleS11, maxLines: 3,textAlign: TextAlign.center,),
                    SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("تومان " , style: MyStyle.lightPinkTextStyleS13, maxLines: 2,textAlign: TextAlign.center,),
                        Text(widget.p.cost.toString() , style: MyStyle.lightPinkTextStyleS13, maxLines: 2,textAlign: TextAlign.center,),
                      ],
                    ),
                    SizedBox(height: MyStyle.mediaQueryHeight(context, 0.002),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
