import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/buyer_model.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/chat_list_item.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/text_field.dart';

class ChatList extends StatefulWidget {

  final bool isForShop;
  final BuyerModelForChat buyer;//use if isForsShop=false
  final ShopVitrineModel shop;

  const ChatList({Key key, this.shop, this.isForShop, this.buyer}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatListState();
}

class ChatListState extends State<ChatList> {

  final TextEditingController _txtMobileNumber = TextEditingController();
  final FocusNode _fndMobileNumber = FocusNode();

  final List<BuyerModelForChat> buyers = [
    BuyerModelForChat(
        buyerName: "فاطمه بابائی",
        buyerProvince: "زنجان",
        buyerCity: "سلطانیه",
        mobileNo: "09908733108" ,
        userType: "normal",
      lastMessageSeen: false,
    ),
    BuyerModelForChat(
        buyerName: "مهسا فراهانی",
        buyerProvince: "تهران",
        buyerCity: "تهران",
        mobileNo: "09908733108" ,
        userType: "normal",
      lastMessageSeen: true,
    ),
    BuyerModelForChat(
        buyerName: "مسعود ملائی",
        buyerProvince: "تهران",
        buyerCity: "تهران",
        mobileNo: "09128410296" ,
        userType: "normal",
      lastMessageSeen: true,
    )
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
                  const GrayAppBar(
                    pageHeaderNameSmall: "",
                    pageHeaderNameLarge: "... گفت و گو با ",
                  ),
                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.72),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                        child: Column(
                          children: [
                            ///0.72-0.37
                            ListView.builder(
                                padding: const EdgeInsets.only(top: 0, bottom: 0),
                                shrinkWrap: true,
                                itemExtent: null,
                                physics: BouncingScrollPhysics(),
                                itemCount: buyers.length,
                                itemBuilder: (BuildContext c, int index) {
                                  return chatListItem(c, buyers[index],);
                                }),

                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  myDialog(
                    width: MyStyle.mediaQueryWidth(context, 0.96),
                    height: MyStyle.mediaQueryHeight(context, 0.4),
                    hasCancel: true,
                    hasButton: true,
                    buttonText: "شروع چت",
                    hasHeader: true,
                    headerText: "ایجاد چت جدید",
                    context: context,
                    onButtonPressed: (){print("Comment saved");},
                    content: MyTextField(
                      width: MyStyle.mediaQueryWidth(context, 0.84),
                     // height: MyStyle.mediaQueryHeight(context, 0.24),
                      textAlign: TextAlign.center,
                      hint: "شماره موبایل مخاطب",
                      keyboardType: TextInputType.text,

                      //maxLine: 6,
                      fontSize: MyStyle.S11,
                     // minLine: 6,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(120),
                      ],
                      onSubmit: (String v) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: _txtMobileNumber,
                      focusNode: _fndMobileNumber,
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
              bottomNavigationBar: widget.isForShop ?
               const ShopBottomNavBar(index: 0,): BuyerBottomNavBar(index:0),
            )));
  }
}
