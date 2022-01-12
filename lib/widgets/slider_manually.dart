import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';

class CommentItem{
  String text;
  String author;
  String date;
  CommentItem({this.text, this.author , this.date});
}

class ManuallyControlledSlider extends StatefulWidget {
  final List<CommentItem> items;

  const ManuallyControlledSlider({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MyStyle.mediaQueryHeight(context, 0.18),
      width: MyStyle.mediaQueryWidth(context, 0.92),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: ()=>_controller.previousPage(),
            child: SvgPicture.asset('assets/svg/backward.svg',color: MyStyle.white,
              width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
          ),
          SizedBox(
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            width: MyStyle.mediaQueryWidth(context, 0.82),
            child: CarouselSlider(
              items: widget.items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                      child: Container(
                        width: MyStyle.mediaQueryWidth(context, 1),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius3)),
                          color: MyStyle.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02) ,
                          vertical: MyStyle.mediaQueryHeight(context, 0.005)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(": ${i.author}" , style: MyStyle.darkTextStyle,),
                            Text(i.text , style: MyStyle.lightGrayTextStyleS11,maxLines: 2,),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                reverse: true,
                aspectRatio: 2,
                height: MyStyle.mediaQueryHeight(context, 0.1),
                autoPlay: true,

              ),
              carouselController: _controller,
            ),
          ),
          InkWell(
            onTap:  ()=>_controller.nextPage(),
            child: SvgPicture.asset('assets/svg/forward.svg',color: MyStyle.white,
              width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
          ),
        ],
      ),
    );
  }
}
