import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/comment_page_item.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/slider_manually.dart';

class TourismSiteComments extends StatefulWidget {
  const TourismSiteComments({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TourismSiteCommentsState();
}

class TourismSiteCommentsState extends State<TourismSiteComments> {
  String siteName = "بازار سنتی زنجان";
  List<CommentItem> cmItems = [
    CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی", date: "1400/03/05"),
    CommentItem(
        date: "1400/03/06",
        text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.",
        author: "امیر شمس"),
    CommentItem(
        date: "1400/10/06",
        text: "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
        author: "سارا نیکوکار"),
    CommentItem(date: "1400/10/18", text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
    CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی", date: "1400/03/05"),
    CommentItem(
        date: "1400/03/06",
        text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.",
        author: "امیر شمس"),
    CommentItem(
        date: "1400/10/06",
        text: "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
        author: "سارا نیکوکار"),
    CommentItem(date: "1400/10/18", text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
  ];

  @override
  Widget build(BuildContext c) {
    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: MyStyle.backgroundColor,
              body: Column(
                children: [
                  ///Logo --> 1.8
                  GrayAppBar(
                    pageHeaderNameSmall: "نظرات در مورد",
                    pageHeaderNameLarge: siteName,
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.72),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///0.35
                          CarouselWithIndicatorDemo(isCommercial: true, items: [
                            ImageSliderItem('assets/image/zanjan_bazar.jpg', () {}),
                            ImageSliderItem('assets/image/zanjan_bazar3.jpg', () {}),
                            ImageSliderItem('assets/image/zanjan_bazar4.jpg', () {}),
                            ImageSliderItem('assets/image/zanjan_bazar5.jpg', () {}),
                          ]),

                          ///0.72-0.37
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              shrinkWrap: true,
                              itemExtent: null,
                              physics: BouncingScrollPhysics(),
                              itemCount: cmItems.length,
                              itemBuilder: (BuildContext c, int index) {
                                return commentPageItem(c, cmItems[index]);
                              }),

                          SizedBox(
                            height: MyStyle.mediaQueryHeight(context, 0.1),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  print("Add Comment");
                  ///TODO
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Container(
                  width: MyStyle.mediaQueryWidth(context, 0.18),
                  height: MyStyle.mediaQueryWidth(context, 0.13),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius1)),
                    color: MyStyle.headerDarkPink,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                      vertical: MyStyle.mediaQueryWidth(context, 0.04)),
                  child: SvgPicture.asset(
                    "assets/svg/plus.svg",
                    height: MyStyle.mediaQueryWidth(context, 0.06),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              bottomNavigationBar: BuyerBottomNavBar(
                index: 0,
              ),
            )));
  }
}
