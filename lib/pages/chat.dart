import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mosallas/models/chat_models.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/chat_message_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:mosallas/widgets/text_field.dart';

class ChatPage extends StatefulWidget {

  final ChatModel chat;
  final bool isForShop;
  const ChatPage({Key key, this.chat, this.isForShop, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {

  ItemScrollController _scrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  final TextEditingController _txtMessage = TextEditingController();
  final FocusNode _fndMobileNumber = FocusNode();

  @override
  Widget build(BuildContext c) {
    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              //resizeToAvoidBottomInset: false,
              backgroundColor: MyStyle.backgroundColor,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ///Logo --> 1.8
                        GrayAppBar(
                          pageHeaderNameSmall: "",
                          pageHeaderNameLarge: widget.chat.buyer.buyerName,
                        ),
                        SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.72),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MyStyle.mediaQueryHeight(context, 0.62),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                                  child: ScrollablePositionedList.builder(
                                    itemPositionsListener: itemPositionsListener,
                                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      reverse: false,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: widget.chat.messages.length,
                                      itemScrollController: _scrollController,
                                      itemBuilder: (BuildContext c, int index) {
                                        return chatMessageItem(c, widget.chat.messages[index],);
                                      }),
                                ),
                              ),
                              SizedBox(height: MyStyle.mediaQueryHeight(context, 0.1),)
                            ],

                          ),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                      child: Column(
                        children: [
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                          MyTextField(
                            prefixIcon: InkWell(
                              onTap: (){
                                if(_txtMessage.text !=""){
                                  setState(() {
                                    widget.chat.messages
                                        .add(MessageModel(sender: "shop", text: _txtMessage.text, date: "1400/11/3"));
                                    _txtMessage.text = "";
                                    _scrollController.jumpTo(index: widget.chat.messages.length-1);
                                  });
                                }
                              },
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                                child: SvgPicture.asset("assets/svg/send.svg",color: MyStyle.headerDarkPink,width: MyStyle.mediaQueryWidth(context, 0.03),fit: BoxFit.fitWidth,),
                              ),
                            ),
                            width: MyStyle.mediaQueryWidth(context, 0.92),
                            height: MyStyle.mediaQueryHeight(context, 0.07),
                            textAlign: TextAlign.right,
                            hint: "   ...   ",
                            keyboardType: TextInputType.text,
                            borderColor: MyStyle.white,
                            //maxLine: 6,
                            fontSize: MyStyle.S11,
                            // minLine: 6,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(120),
                            ],
                            onSubmit: (String v) {
                              FocusScope.of(context).unfocus();
                            },
                            controller: _txtMessage,
                            focusNode: _fndMobileNumber,
                          ),
                          SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),

                        ],
                      ),
                    ),
                  )
                ]
              ),
              bottomNavigationBar: widget.isForShop ?
              const ShopBottomNavBar(index: 0,): BuyerBottomNavBar(index:0),
            )));
  }
}
