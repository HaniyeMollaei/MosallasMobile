import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';

Widget carouselSlider(BuildContext c, {List<ImageSliderItem> items}) {
  return CarouselSlider(
    options: CarouselOptions(
      height: MyStyle.mediaQueryHeight(c, 0.2),
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      enlargeCenterPage: true,
      pageSnapping: true,
      scrollDirection: Axis.horizontal,
      aspectRatio: 2.0,
    ),
    items: items.map((i) {
      print(i.path);
      return Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: i.onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                child: Image.asset(
                  i.path,
                )),
          );
        },
      );
    }).toList(),
  );
}

class ImageSliderItem {
  Function onTap;
  String path;
  ImageSliderItem(this.path, this.onTap);
}


/// Used in home page
class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<ImageSliderItem> items;
  final bool isCommercial;

  const CarouselWithIndicatorDemo({Key key, this.items, this.isCommercial = true}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyStyle.mediaQueryHeight(context, widget.isCommercial ? 0.25 : 0.32),
      child: Column(children: [
          CarouselSlider(
            items: widget.items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: i.onTap,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                      child: Image.asset(
                        i.path,
                        height: MyStyle.mediaQueryHeight(context, widget.isCommercial? 0.2 : 0.29),
                      ),
                      ),
                    );
                },
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 4.0,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                enableInfiniteScroll: true,
                reverse: true,
                height: MyStyle.mediaQueryHeight(context, widget.isCommercial? 0.2 : 0.28),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark ? MyStyle.lightGrayText : MyStyle.disableButtonColor)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]),
    );
  }
}
