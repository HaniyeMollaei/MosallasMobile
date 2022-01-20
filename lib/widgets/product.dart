import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/pages/buyers/shops/product_page.dart';
import 'package:mosallas/utils/my_style.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel p;
  final Function onRemove;
  final Function onClickFunction;
  const ProductWidget({
    Key key,
    this.p, this.onRemove, this.onClickFunction,
  }) : super(key: key);
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.015)),
      child: SizedBox(
        width: MyStyle.mediaQueryWidth(context, 0.29),
        //height: MyStyle.mediaQueryHeight(context, 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: widget.onClickFunction ?? () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuyerProductPage(
                          product: widget.p,
                        )));
              },
              child: Container(
                height: MyStyle.mediaQueryHeight(context, 0.18),
                width: MyStyle.mediaQueryWidth(context, 0.29),
                decoration: BoxDecoration(
                  color: MyStyle.white,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.01),
                    ),
                    Image.asset(
                      widget.p.imagePath[0],
                      height: MyStyle.mediaQueryHeight(context, 0.12),
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.01),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/star.svg'),
                        Text(
                          " ${widget.p.star.toString()}",
                          style: MyStyle.lightPinkTextStyleS13,
                          maxLines: 3,
                        )
                      ],
                    )
                  ],
                ),
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
                  Text(
                    widget.p.name,
                    style: MyStyle.darkTextStyleS11,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.01),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.p.isRemovable? InkWell(onTap: widget.onRemove,
                          child: SvgPicture.asset("assets/svg/waste_basket.svg")):Container(),
                      widget.p.isRemovable? SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),):Container(),
                       Text(
                        "تومان ",
                        style: MyStyle.mediaQueryWidth(context, 1) > 330 ? MyStyle.lightPinkTextStyleS13 : MyStyle.lightPinkTextStyleS11,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.p.cost.toString(),
                        style: MyStyle.mediaQueryWidth(context, 1) > 330 ? MyStyle.lightPinkTextStyleS13 : MyStyle.lightPinkTextStyleS11,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.002),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
