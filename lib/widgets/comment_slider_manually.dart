import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/comment_model.dart';
import 'package:mosallas/utils/my_style.dart';



class ManuallyControlledCommentSlider extends StatefulWidget {
  final List<CommentItem> items;
  final bool hasSideWidget;

  const ManuallyControlledCommentSlider({Key key, this.items , this.hasSideWidget = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledCommentSliderState();
  }
}

class _ManuallyControlledCommentSliderState extends State<ManuallyControlledCommentSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MyStyle.mediaQueryHeight(context, 0.18),
      width: MyStyle.mediaQueryWidth(context,widget.hasSideWidget? 0.72: 0.92),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: ()=>_controller.previousPage(),
            child: SizedBox(
            width: MyStyle.mediaQueryWidth(context, 0.02),
              height: MyStyle.mediaQueryHeight(context, 0.08),
              child: SvgPicture.asset('assets/svg/backward.svg',color: MyStyle.white,
                width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
            ),
          ),
          SizedBox(
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            width: MyStyle.mediaQueryWidth(context, widget.hasSideWidget? 0.64 : 0.82),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: MyStyle.mediaQueryWidth(context, 0.02) ,
                          vertical: MyStyle.mediaQueryHeight(context, 0.005)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Text(": ${i.author}" , style: MyStyle.darkTextStyle,),
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
                height: MyStyle.mediaQueryHeight(context, 0.08),
                autoPlay: true,

              ),
              carouselController: _controller,
            ),
          ),
          InkWell(
            onTap:  ()=>_controller.nextPage(),
            child: SizedBox(
              width: MyStyle.mediaQueryWidth(context, 0.02),
              height: MyStyle.mediaQueryHeight(context, 0.08),
              child: SvgPicture.asset('assets/svg/forward.svg',color: MyStyle.white,
                width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
            ),
          ),
        ],
      ),
    );
  }
}
