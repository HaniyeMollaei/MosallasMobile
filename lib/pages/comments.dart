import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/comment_page_item.dart';
import 'package:mosallas/widgets/comment_slider_manually.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/text_field.dart';

class TourismSiteComments extends StatefulWidget {

  final Widget header;
  final String type;
  final String shopCode;

  const TourismSiteComments({Key key, this.header, this.type, this.shopCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TourismSiteCommentsState();
}

class TourismSiteCommentsState extends State<TourismSiteComments> {

  TextEditingController _txtDescription = TextEditingController();
  FocusNode _fndDescription = FocusNode();


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
                  (widget.type =="shop")? MediumLogo(finalType: "location",): GrayAppBar(
                    pageHeaderNameSmall: "نظرات در مورد",
                    pageHeaderNameLarge: siteName,
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.72),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          widget.header,
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
                  myDialog(
                    width: MyStyle.mediaQueryWidth(context, 0.96),
                    height: MyStyle.mediaQueryHeight(context, 0.6),
                    hasCancel: true,
                    hasButton: true,
                    buttonText: "ثبت",
                    hasHeader: true,
                    headerText: "ثبت نظر",
                    context: context,
                    onButtonPressed: (){print("Comment saved");},
                    content: MyTextField(
                      width: MyStyle.mediaQueryWidth(context, 0.84),
                      height: MyStyle.mediaQueryHeight(context, 0.35),
                      textAlign: TextAlign.end,
                      hint: "...",
                      keyboardType: TextInputType.text,
                      maxLine: 6,
                      minLine: 6,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(80),
                      ],
                      onSubmit: (String v) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: _txtDescription,
                      focusNode: _fndDescription,
                    ),


                  );
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
                index:widget.type =="shop"? 2 : 0,
              ),
            )));
  }
}
