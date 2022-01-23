
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mosallas/models/comment_model.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/shop/shop_vitrine_page.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/comment_pink_box.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/appbar_light.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/empty_photo.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/shop_vitrine.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';

import '../comments.dart';
import '../chat_list.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShopHomeState();
}

class ShopHomeState extends State<ShopHome> {
  List<ImageSliderItem> imageList = [
    ImageSliderItem(path: 'assets/image/off50.jpg',onTap:  () {
      print("Image taaaaaaap 11111");
    }),
    ImageSliderItem(path: 'assets/image/man_off.jpg', onTap: () {
      print("Image taaaaaaap 22222");
    }),
    ImageSliderItem(path: 'assets/image/off50.jpg', onTap:  () {
      print("Image taaaaaaap 33333");
    }),
  ];

  List<CommentItem> cmList = [
    CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی"),
    CommentItem(text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.", author: "امیر شمس"),
    CommentItem(
        text: "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
        author: "سارا نیکوکار"),
    CommentItem(text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
  ];

  ShopVitrineModel shop = ShopVitrineModel(
      shopName: "فروشگاه لباس مجلسی ایلگا",
      address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
      shopCode: "mnb876gi99",
      phoneNumber: "09123456789",
      shippingCost: 12000,
      star: 4.3,
      shopImagePath: "assets/image/ilga.jpg",
      productsImagePath: ["assets/image/6.jpg", "assets/image/12.jpg"]);

  Widget slider;
  Widget vitrine;

  final TextEditingController _txtName = TextEditingController();
  final FocusNode _fndName = FocusNode();

  final TextEditingController _txtAddress = TextEditingController();
  final FocusNode _fndAddress = FocusNode();

  final TextEditingController _txtPostalCode = TextEditingController();
  final FocusNode _fndPostalCode = FocusNode();


  final TextEditingController _txtPhoneNumber = TextEditingController();
  final FocusNode _fndPhoneNumber = FocusNode();

  final ImagePicker _picker = ImagePicker();

  Widget addBanner(){
    XFile image;
    return myDialog(
      width: MyStyle.mediaQueryWidth(context, 0.92),
      height: MyStyle.mediaQueryHeight(context, 0.5),
      hasCancel: true,
      hasButton: true,
      buttonText: "ثبت تغییرات",
      hasHeader: true,
      headerText: "افزودن بنر به ویترین فروشگاه",
      context: context,
      onButtonPressed: () async {
        print("Banner saved");},
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shop.shopImagePath != null ? emptyPhoto(context: context ,
                h: MyStyle.mediaQueryHeight(context, 0.13),
                w: MyStyle.mediaQueryWidth(context, 0.5),
              ) :
              ClipRRect(
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                  child: image.path == null ?
                  Image.asset( shop.shopImagePath ,
                    height: MyStyle.mediaQueryHeight(context, 0.13),):
                  kIsWeb
                      ? Image.network(image.path,height: MyStyle.mediaQueryHeight(context, 0.13))
                      : Image.file(File(image.path),height: MyStyle.mediaQueryHeight(context, 0.13)),
              ),
              InkWell(
                onTap: () async {

                  //WidgetsBinding.instance.addPostFrameCallback((_) async {
                    image = await _picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                    });
                  //});
                  print(image.path);
                },
                child: Container(
                  height: MyStyle.mediaQueryHeight(context, 0.13),
                  width: MyStyle.mediaQueryWidth(context, 0.16),
                  decoration: BoxDecoration(
                    color: MyStyle.headerDarkPink,
                    borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MyStyle.mediaQueryWidth(context, 0.01),
                      vertical: MyStyle.mediaQueryHeight(context, 0.007)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ///chat
                      children:[ SvgPicture.asset("assets/svg/plus.svg",
                        width: MyStyle.mediaQueryWidth(context, 0.04),
                        fit: BoxFit.fitWidth,
                      ),

                        Padding(
                          padding:  EdgeInsets.only(top:MyStyle.mediaQueryHeight(context, 0.01), ),
                          child: const Text("تغییر یا افزودن عکس فروشگاه" ,textAlign: TextAlign.center,
                            maxLines: 3, style: MyStyle.whiteLightTextStyle,),
                        ) ,
                      ]
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
        ],
      )
    );
  }

  Widget editDialog(){
    //_txtName.text = AppConstants.BUYER_NAME;

    setState(() {
      _txtName.text = AppConstants.SHOP_NAME;
      _txtAddress.text = AppConstants.SHOP_ADDRESS;
      _txtPostalCode.text = AppConstants.SHOP_POSTAL_CODE;
      _txtPhoneNumber.text = AppConstants.MOBILE_NUMBER;
    });
    ///TODO
    return myDialog(
      width: MyStyle.mediaQueryWidth(context, 0.92),
      height: MyStyle.mediaQueryHeight(context, 0.91),
      hasCancel: true,
      hasButton: true,
      buttonText: "ویرایش",
      hasHeader: true,
      headerText: "ویرایش اطلاعات",
      context: context,
      onButtonPressed: (){print("Comment saved");},
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                  child: Image.asset(shop.shopImagePath , height: MyStyle.mediaQueryHeight(context, 0.12),)),
              InkWell(
                onTap: (){},
                child: Container(
                  height: MyStyle.mediaQueryHeight(context, 0.12),
                  width: MyStyle.mediaQueryWidth(context, 0.16),
                  decoration: BoxDecoration(
                    color: MyStyle.headerDarkPink,
                    borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MyStyle.mediaQueryWidth(context, 0.01),
                      vertical: MyStyle.mediaQueryHeight(context, 0.007)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ///chat
                   children:[ SvgPicture.asset("assets/svg/plus.svg",
                     width: MyStyle.mediaQueryWidth(context, 0.04),
                     fit: BoxFit.fitWidth,
                   ),

                   Padding(
                      padding:  EdgeInsets.only(top:MyStyle.mediaQueryHeight(context, 0.01), ),
                      child: const Text("تغییر یا افزودن عکس فروشگاه" ,textAlign: TextAlign.center,
                        maxLines: 3, style: MyStyle.whiteLightTextStyle,),
                    ) ,
]


                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.center,
            hint: "نام فروشگاه",
            keyboardType: TextInputType.text,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(30),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtName,
            focusNode: _fndName,
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyDrawer(text: "شهرستان",attribute:"BUYER_CITY", isGray: true,
                content: const ["زنجان" , "سلطانیه" ,  "ابهر" ,  "خرمدره" , " ماهنشان" , "ایجرود","قیدار" , " هیدج" , "صائین قلعه"],),
              SizedBox(width: MyStyle.mediaQueryWidth(context, 0.03),),
              MyDrawer(text: "استان",attribute:"BUYER_PROVINCE", isGray: true,
                content: const ["زنجان" , "تهران" ,  "مشهد" ,  "قزوین" , " اردبیل" , "اصفهان"],),
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            height: MyStyle.mediaQueryHeight(context, 0.16),
            textAlign: TextAlign.center,
            hint: "آدرس",
            keyboardType: TextInputType.text,
            maxLine: 4,
            fontSize: MyStyle.S13,
            minLine: 4,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(120),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtAddress,
            focusNode: _fndAddress,
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.center,
            hint: "کد پستی",
            keyboardType: TextInputType.text,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(30),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtPostalCode,
            focusNode: _fndPostalCode,
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.center,
            hint: "شماره موبایل",
            keyboardType: TextInputType.text,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(12),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            onTap: ()=>_fndPhoneNumber,
            controller: _txtPhoneNumber,
            focusNode: _fndPhoneNumber,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext c) {

    slider = ManuallyControlledImageSlider(
      items: imageList,
      isCommercial: true,
    );

    vitrine = shopVitrine(context: c,shopVitrineItem: shop,justHeader: true);
    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: MyStyle.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Logo --> 1.5
                    const MediumLogo(
                      finalType: "location",
                    ),
                    SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.75),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            ///vitrine
                            vitrine,
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.02),
                            ),

                            ///button row
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                InkWell(
                                  onTap: addBanner,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                                      color: MyStyle.headerDarkPink,
                                    ),
                                    height: MyStyle.mediaQueryHeight(context, 0.06),
                                    width: MyStyle.mediaQueryWidth(context, 0.45),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "افزودن بنر به ویترین",
                                            maxLines: 2,
                                            style: TextStyle(fontSize: MyStyle.S13 ,fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                                          ),
                                          SizedBox(
                                            width: MyStyle.mediaQueryWidth(context, 0.01),
                                          ),
                                          SvgPicture.asset(
                                            "assets/svg/plus.svg",
                                            color: MyStyle.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: editDialog,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                                      color: MyStyle.headerDarkPink,
                                    ),
                                    height: MyStyle.mediaQueryHeight(context, 0.06),
                                    width: MyStyle.mediaQueryWidth(context, 0.45),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "ویرایش اطلاعات",
                                            style: TextStyle(fontSize: MyStyle.S13, fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: MyStyle.mediaQueryWidth(context, 0.08),),
                                            child: SvgPicture.asset(
                                              "assets/svg/edit.svg",
                                              color: MyStyle.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],),
                            ),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.02),
                            ),
                            ///image slider - commercial
                            slider,
                            ///comment - call - chat
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  callAndChat(
                                    context: c,
                                    shopCode: shop.shopCode,
                                    justChat: true,
                                    chatOnTap: (){
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1, animation2) => ChatList(
                                            isForShop: true,
                                            shop: shop,
                                          ),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );

                                    }
                                  ),
                                  commentPinkBox(
                                      context: c,
                                      hasSideWidget: true,
                                      cmList: cmList,
                                      type: "shop",
                                      routToCommentsPage: () async {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1, animation2) => Comments(
                                              header: vitrine,
                                              type: "shop",
                                              code: shop.shopCode,
                                              isForShop: true,
                                            ),
                                            transitionDuration: Duration.zero,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ProductWidget(
                                    p: ProductModel(
                                      name: "پیراهن آستین بلند مردانه",
                                      code: "hgd65435hj",
                                      cost: 123000,
                                      imagePath: ['assets/image/5.jpg'],
                                      isRemovable: false,
                                      star: 4.5,
                                      hasOnlineSell: true,
                                      category: "پوشاک",
                                      description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                      shopCode: "063487",
                                    ),
                                  ),
                                  ProductWidget(
                                    p: ProductModel(
                                      name: "پیراهن آستین بلند مردانه",
                                      code: "hgd65435hj",
                                      cost: 123000,
                                      description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                      imagePath: ['assets/image/6.jpg'],
                                      isRemovable: false,
                                      star: 4.5,
                                      shopCode: "063487",
                                      hasOnlineSell: true,
                                      category: "پوشاک",
                                    ),
                                  ),
                                  ProductWidget(
                                    p: ProductModel(
                                      hasOnlineSell: true,
                                      category: "پوشاک",
                                      description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
                                      name: "پیراهن آستین بلند مردانه",
                                      code: "hgd65435hj",
                                      cost: 123000,
                                      imagePath: [
                                        'assets/image/12.jpg',
                                        'assets/image/10.jpg',
                                      ],
                                      isRemovable: false,
                                      star: 4.5,
                                      shopCode: "063487",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),

                            SubmitButton(
                              text: "ویرایش محصولات ویترین",
                              textSize: MyStyle.S17,
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => ShopVitrinePage(
                                      shop: shop,
                                    ),
                                    transitionDuration: Duration.zero,
                                  ),
                                );},
                            ),
                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: const ShopBottomNavBar(
                index: 0,
              ),
            )));
  }
}
