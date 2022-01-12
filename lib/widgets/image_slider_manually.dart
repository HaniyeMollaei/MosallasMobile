import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';

import 'cursol_slider.dart';


class ManuallyControlledImageSlider extends StatefulWidget {
  final List<ImageSliderItem> items;
  final bool isCommercial;
  const ManuallyControlledImageSlider({Key key, this.items, this.isCommercial}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledImageSliderState();
  }
}

class _ManuallyControlledImageSliderState extends State<ManuallyControlledImageSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MyStyle.mediaQueryHeight(context, 0.18),
      width: MyStyle.mediaQueryWidth(context, 0.88),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: ()=>_controller.previousPage(),
            child: SvgPicture.asset('assets/svg/backward.svg',color: MyStyle.headerDarkPink,
              width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
          ),
          SizedBox(
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            width: MyStyle.mediaQueryWidth(context, 0.78),
            child: CarouselSlider(
              items: widget.items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.08),),
                      child: InkWell(
                        onTap: i.onTap,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                          child: Image.asset(
                            i.path,
                            //fit:BoxFit.fitHeight,
                            //width: MyStyle.mediaQueryWidth(context, 0.75),
                            //height: MyStyle.mediaQueryHeight(context, widget.isCommercial? 0.2 : 0.29
                            ),
                          ),
                        ),
                      );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                reverse: true,
                aspectRatio: 2,
                height: MyStyle.mediaQueryHeight(context, widget.isCommercial? 0.2 : 0.29),
                autoPlay: true,

              ),
              carouselController: _controller,
            ),
          ),
          InkWell(
            onTap:  ()=>_controller.nextPage(),
            child: SvgPicture.asset('assets/svg/forward.svg',color: MyStyle.headerDarkPink,
              width: MyStyle.mediaQueryWidth(context, 0.02), fit: BoxFit.fitWidth,),
          ),
        ],
      ),
    );
  }
}
