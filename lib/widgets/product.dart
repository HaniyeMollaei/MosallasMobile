import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key key, this.name, this.code, this.cost, this.imagePath, this.star, this.isRemovable})
      : super(key: key);

  final String name;
  final String code;
  final int cost;
  final String imagePath;
  final double star;
  final bool isRemovable;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyStyle.mediaQueryWidth(context, 0.015)),
      child: SizedBox(
        width: MyStyle.mediaQueryWidth(context, 0.3),
        //height: MyStyle.mediaQueryHeight(context, 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MyStyle.mediaQueryHeight(context, 0.18),
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
                    widget.imagePath,
                    height: MyStyle.mediaQueryHeight(context, 0.12),
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/star.svg'),
                      Text(" ${widget.star.toString()}" , style: MyStyle.lightPinkTextStyle, maxLines: 3,)
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MyStyle.mediaQueryHeight(context, 0.14),
              decoration: BoxDecoration(
                color: MyStyle.white,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
              ),
              padding: EdgeInsets.only(top: MyStyle.mediaQueryHeight(context, 0.01)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.name , style: MyStyle.lightGrayTextStyleS11, maxLines: 3,textAlign: TextAlign.center,),
                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                  Text(widget.cost.toString() , style: MyStyle.darkTextStyle, maxLines: 2,textAlign: TextAlign.center,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
