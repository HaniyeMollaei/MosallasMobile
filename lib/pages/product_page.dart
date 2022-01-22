import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mosallas/models/comment_model.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/pages/buyers/shops/online_shop.dart';
import 'package:mosallas/pages/comments.dart';
import 'package:mosallas/state_management/add_new_product_provider.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/call_and_chat.dart';
import 'package:mosallas/widgets/comment_pink_box.dart';
import 'package:mosallas/widgets/cursol_slider.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/empty_photo.dart';
import 'package:mosallas/widgets/image_slider_manually.dart';
import 'package:mosallas/widgets/radio_button.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {

  final bool isForShop;
  final ProductModel product;
  final Uint8List img;
  const ProductPage({Key key, this.product, this.isForShop = false, this.img, }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {


  String shopName = "فروشگاه لباس مجلسی ایلگا";

  final ImagePicker _picker = ImagePicker();

  AddNewProductProvider _addNewProductProvider = new AddNewProductProvider();

  final TextEditingController _txtName = TextEditingController();
  final FocusNode _fndName = FocusNode();

  final TextEditingController _txtCost = TextEditingController();
  final FocusNode _fndCost = FocusNode();

  final TextEditingController _txtNumber = TextEditingController();
  final FocusNode _fndNumber = FocusNode();

  final TextEditingController _txtDescription = TextEditingController();
  final FocusNode _fndDescription = FocusNode();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _addNewProductProvider = Provider.of<AddNewProductProvider>(context, listen: false);
    });
  }


  @override
  Widget build(BuildContext c) {
    List<CommentItem> cmList =  [
      CommentItem(text: "خیلی بازار زنده و پر طراوتیه", author: "مینا صدوقی"),
      CommentItem(
          text: "در مرکز شهر واقع شده و از این لحاظ توی دسترسی خیلی برای مسافران راحته.",
          author: "امیر شمس"),
      CommentItem(
          text:
          "تعداد مغازه ها و فروشگاه های بازار خیلی زیاده و میتونید نصف روز تا یک روز وقتتون رو بگذرونید.",
          author: "سارا نیکوکار"),
      CommentItem(text: "به ما خیلی خوش گذشت اینجا ^^", author: "هما"),
    ];

    ShopVitrineModel shop =  ShopVitrineModel(
        shopName: "فروشگاه لباس مجلسی ایلگا",
        address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
        shopCode: "mnb876gi99",
        star: 4.3,
        shippingCost: 12000,
        phoneNumber: "09123456789",
        shopImagePath: "assets/image/ilga.jpg",
        productsImagePath: ["assets/image/6.jpg","assets/image/12.jpg"]
    );

    // Widget slider = ManuallyControlledImageSlider(isCommercial: false, items: [
    //   ImageSliderItem('assets/image/5.jpg', () {}),
    //   ImageSliderItem('assets/image/6.jpg', () {}),
    //   ImageSliderItem('assets/image/9.jpg', () {}),
    //   ImageSliderItem('assets/image/8.jpg', () {}),
    // ]);

    Widget slider = ManuallyControlledImageSlider(isCommercial: false, items: [
      ImageSliderItem(img: widget.img, onTap: () {},isUint: widget.img == null ? false :true, path: widget.product.imagePath[0]),
    ]);

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
                  ///Logo --> 1.5
                  GrayAppBar(
                    pageHeaderNameLarge: shopName ,
                    pageHeaderNameSmall:"",
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.04)),
                    child: SizedBox(
                      height: MyStyle.mediaQueryHeight(context, 0.72),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            slider,

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                            Container(
                              padding: EdgeInsets.all(MyStyle.mediaQueryWidth(context, 0.025)),
                              decoration: BoxDecoration(
                                color: MyStyle.white,
                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:MyStyle.mediaQueryWidth(context, 0.8),
                                    child: Text(widget.product.name ,
                                      textAlign: TextAlign.end, style: MyStyle.darkTextStyleS15,maxLines: 2,),
                                  ),
                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start ,
                                        children: [
                                          SvgPicture.asset("assets/svg/star.svg" ,fit: BoxFit.fitHeight, height: MyStyle.mediaQueryHeight(context, 0.02),),
                                          SizedBox(width: MyStyle.mediaQueryWidth(context, 0.01),),
                                          Text(widget.product.star.toString() , style: MyStyle.lightPinkTextStyleS13,),
                                        ],
                                      ),
                                      Align(
                                        alignment:Alignment.centerRight,
                                        child: Text(widget.product.code ,
                                          textAlign: TextAlign.end, style: MyStyle.lightGrayTextStyleS13,maxLines: 1,),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: MyStyle.mediaQueryHeight(context, 0.01),),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text("تومان" , style: MyStyle.lightPinkTextStyleS13,),
                                          Text(widget.product.cost.toString() , style: MyStyle.lightPinkTextStyleS13,),
                                        ],
                                      ),
                                      Text( widget.product.category ?? "بدون دسته بندی", style: MyStyle.lightGrayTextStyleS13,)
                                    ],),
                                ],
                              ),
                            ),

                            widget.product.hasOnlineSell ?
                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),):Container(),


                            (widget.product.hasOnlineSell && !widget.isForShop) ?
                            SubmitButton(
                                text:"  خرید آنلاین  ",
                                onPressed:(){
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation1, animation2) => OnlineShopPage(
                                       product: widget.product,
                                      ),
                                      transitionDuration: Duration.zero,
                                    ),
                                  );                                },
                              width: MyStyle.mediaQueryWidth(context, 0.5),
                              height: MyStyle.mediaQueryHeight(context, 0.06),
                              textSize: MyStyle.S13,
                            ):Container(),
                            widget.isForShop ?
                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),):Container(),

                            (widget.isForShop) ?
                            SubmitButton(
                              text:  "   ویرایش   ",
                              onPressed: addNewProductPhoto,
                              width: MyStyle.mediaQueryWidth(context, 0.5),
                              height: MyStyle.mediaQueryHeight(context, 0.06),
                              textSize: MyStyle.S13,
                            ):Container(),
                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.03),),

                            ///description
                            Container(
                              width: MyStyle.mediaQueryWidth(context, 0.92),
                              decoration: BoxDecoration(
                                color: MyStyle.white,
                                borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: MyStyle.mediaQueryWidth(context, 0.03),
                                  vertical: MyStyle.mediaQueryHeight(context, 0.02)),
                              child: Text(
                                widget.product.description,
                                style: MyStyle.lightGrayTextStyleS13,
                                textAlign: TextAlign.right,
                              ),
                            ),

                            SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),),


                            ///comment - call - chat
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.isForShop ?
                                InkWell(
                                  onTap:onShopProductDelete,
                                  child: Container(
                                    height: MyStyle.mediaQueryHeight(context, 0.18),
                                    width: MyStyle.mediaQueryWidth(context, 0.16),
                                    decoration: BoxDecoration(
                                      color: MyStyle.headerDarkPink,
                                      borderRadius: BorderRadius.circular(MyStyle.borderRadius2),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyStyle.mediaQueryWidth(context, 0.01),
                                        vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                      SvgPicture.asset(
                                        "assets/svg/waste_basket.svg",
                                        color:MyStyle.white,
                                        width: MyStyle.mediaQueryWidth(context, 0.06),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MyStyle.mediaQueryHeight(context, 0.02),
                                        ),
                                        child: const Text(
                                          "حذف محصول از فروشگاه",
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: MyStyle.whiteLightTextStyle,
                                        ),
                                      ),
                                    ]),
                                  ),
                                )
                                :callAndChat(
                                  context: c,
                                  shopCode: widget.product.shopCode,
                                  phoneNumber: shop.phoneNumber,
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
                                            header: slider,
                                            type: "product",
                                            code: widget.product.code,
                                          ),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );
                                    }),
                              ],
                            ),

                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.03),
                            ),



                          ],
                        ),
                      )
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: widget.isForShop? const ShopBottomNavBar(index:2) :
              BuyerBottomNavBar(
                index: 2,
              ),
            )));
  }


  Widget onShopProductDelete() {
    print("what happenssss");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.96),
        height: MyStyle.mediaQueryHeight(context, 0.3),
        hasCancel: true,
        hasButton: true,
        buttonText: "بله مطمئنم",
        hasHeader: false,
        context: context,
        onButtonPressed: () async {
          setState(() {
            //shopProducts.removeAt(index);
            Navigator.pop(context);
            Navigator.pop(context);
          });
        },
        content: const Align(
          alignment: Alignment.center,
          child: Text(
            "از حذف این محصول مطمئن هستید؟",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: MyStyle.S17, color: MyStyle.lightGrayText, fontFamily: MyStyle.textMediumFont),
          ),
        ),
      );
    });
  }

  Widget addNewProductPhoto() {
    _addNewProductProvider.setUploadedImage(widget.img) ;
    print("widget.product.imagePath[0]");
    print(widget.product.imagePath[0]);
    print("widget.img");
    print(widget.img);
    return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.92),
        height: MyStyle.mediaQueryHeight(context, 0.6),
        hasCancel: true,
        hasButton: true,
        buttonText: "ادامه",
        hasHeader: true,
        headerText: "بارگذاری تصویر محصول",
        context: context,
        onButtonPressed: () async {
          print("Banner saved");
          Navigator.of(context).pop();
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            getNewProductInformation();
          });
        },
        content: Consumer<AddNewProductProvider>(builder: (_, __, ___) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (_addNewProductProvider.uploadedImage  == null && widget.img == null && widget.product.imagePath[0] == null)
                      ? emptyPhoto(
                    context: context,
                    h: MyStyle.mediaQueryWidth(context, 0.5),
                    w: MyStyle.mediaQueryWidth(context, 0.5),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                    child:widget.product.imagePath[0] != null ?
                    Image.asset(widget.product.imagePath[0],height: MyStyle.mediaQueryWidth(context, 0.5),
                        width: MyStyle.mediaQueryWidth(context, 0.5),
                        fit: BoxFit.fitWidth):
                    kIsWeb
                        ? Image.network(_addNewProductProvider.image.path,
                        height: MyStyle.mediaQueryWidth(context, 0.5),
                        width: MyStyle.mediaQueryWidth(context, 0.5),
                        fit: BoxFit.fitWidth)
                        : Image.memory(
                      _addNewProductProvider.uploadedImage,
                      height: MyStyle.mediaQueryWidth(context, 0.5),
                      width: MyStyle.mediaQueryWidth(context, 0.5),
                      fit: BoxFit.fitWidth,
                    ),
                    // : Image.file(
                    //     File(_addNewProductProvider.image.path),
                    //     height: MyStyle.mediaQueryWidth(context, 0.5),
                    //     width: MyStyle.mediaQueryWidth(context, 0.5),
                    //     fit: BoxFit.fitWidth,
                    //   ),
                  ),
                  InkWell(
                    onTap: () async {
                      final i = await _picker.pickImage(source: ImageSource.gallery);
                      final v = await i.readAsBytes();
                      _addNewProductProvider.setUploadedImage(v);
                      _addNewProductProvider.setImage(i);
                      //final dir = await getExternalStorageDirectory();
                      setState(() {});
                      print(v);
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
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        SvgPicture.asset(
                          "assets/svg/plus.svg",
                          width: MyStyle.mediaQueryWidth(context, 0.04),
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MyStyle.mediaQueryHeight(context, 0.01),
                          ),
                          child: const Text(
                            "افزودن تصویر",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: MyStyle.whiteLightTextStyle,
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.01),
              ),
            ],
          );
        }));
  }

  Widget getNewProductInformation() {
    _txtCost.text = widget.product.cost.toString();
    _txtName.text = widget.product.name;
    _txtNumber.text = widget.product.inventory.toString();
    ///TODO
    return myDialog(
      width: MyStyle.mediaQueryWidth(context, 0.92),
      height: MyStyle.mediaQueryHeight(context, 0.7),
      hasCancel: true,
      hasButton: true,
      buttonText: "ادامه",
      hasHeader: true,
      headerText: "ثبت اطلاعات محصول",
      context: context,
      onButtonPressed: () {
        Navigator.of(context).pop();
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          getNewProductInformation2();
        });
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("نام محصول را به همراه رنگ و سایز وارد نمائید",
              textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            height: MyStyle.mediaQueryHeight(context, 0.13),
            isGray: true,
            textAlign: TextAlign.center,
            hint: "",
            keyboardType: TextInputType.text,
            maxLine: 2,
            fontSize: MyStyle.S13,
            minLine: 2,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(50),
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
              MyTextField(
                width: MyStyle.mediaQueryWidth(context, 0.35),
                height: MyStyle.mediaQueryHeight(context, 0.05),
                textAlign: TextAlign.center,
                hint: "تعداد",
                isGray: true,
                keyboardType: TextInputType.number,
                maxLine: 1,
                fontSize: MyStyle.S13,
                minLine: 1,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(5),
                ],
                onSubmit: (String v) {
                  FocusScope.of(context).unfocus();
                },
                controller: _txtNumber,
                focusNode: _fndNumber,
              ),
              SizedBox(
                width: MyStyle.mediaQueryWidth(context, 0.03),
              ),
              MyDrawer(
                isGray: true,
                text: widget.product.category ?? "دسته بندی",
                attribute: "SHOP_CATEGORY",
                content: const [
                  "پوشاک",
                  "لوازم خانگی",
                  "خوار و بار",
                  "پارچه فروشی",
                  "قطعات خودرو",
                ],
              ),
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.02),
          ),
          const Text(".قیمت محصول را وارد نمائید", textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          MyTextField(
            width: MyStyle.mediaQueryWidth(context, 0.84),
            //height: MyStyle.mediaQueryHeight(context, 0.18),
            textAlign: TextAlign.center,
            hint: "",
            isGray: true,
            keyboardType: TextInputType.number,
            maxLine: 1,
            fontSize: MyStyle.S13,
            minLine: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(12),
            ],
            onSubmit: (String v) {
              FocusScope.of(context).unfocus();
            },
            controller: _txtCost,
            focusNode: _fndCost,
          ),
        ],
      ),
    );
  }

  Widget getNewProductInformation2() {
    _txtDescription.text = widget.product.description;
    _addNewProductProvider.setHasOnlineSell(widget.product.hasOnlineSell);
    _addNewProductProvider.setHasPhysicalSell(true);
    ///TODO
    return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.92),
        height: MyStyle.mediaQueryHeight(context, 0.73),
        hasCancel: true,
        hasButton: true,
        buttonText: "ثبت",
        hasHeader: true,
        headerText: "ثبت اطلاعات محصول",
        context: context,
        onButtonPressed: () async {
          Navigator.of(context).pop();
          // await Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => ProductPage(
          //   img: _addNewProductProvider.uploadedImage,
          //   isForShop: true,
          //   product: ProductModel(
          //       shopCode: AppConstants.SHOP_CODE,
          //       isRemovable: true,
          //       imagePath: [_addNewProductProvider.image.path ?? widget.product.imagePath[0]?? _addNewProductProvider.uploadedImage],
          //       hasOnlineSell: _addNewProductProvider.hasOnlineSell,
          //       description: _txtDescription.text,
          //       code: "blabla",
          //       category: AppConstants.SHOP_CATEGORY,
          //       name: _txtName.text,
          //       cost: int.parse( _txtCost.text),
          //       star: 0
          //   ),
          // )));
        },
        content: Consumer<AddNewProductProvider>(builder: (_, __, ___) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("توضیحات مربوط به محصول را وارد نمائید",
                  textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.01),
              ),
              MyTextField(
                width: MyStyle.mediaQueryWidth(context, 0.84),
                height: MyStyle.mediaQueryHeight(context, 0.3),
                isGray: true,
                textAlign: TextAlign.center,
                hint: "",
                keyboardType: TextInputType.text,
                maxLine: 10,
                fontSize: MyStyle.S13,
                minLine: 10,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(250),
                ],
                onSubmit: (String v) {
                  FocusScope.of(context).unfocus();
                },
                controller: _txtDescription,
                focusNode: _fndDescription,
              ),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.03),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("خرید حضوری   ", textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
                  SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _addNewProductProvider.setHasPhysicalSell(!_addNewProductProvider.hasPhysicalSell);
                      });
                    },
                    child: myRadioButton(context, value: _addNewProductProvider.hasPhysicalSell),
                  )
                ],
              ),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("خرید آنلاین   ", textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
                  SizedBox(width: MyStyle.mediaQueryWidth(context, 0.02),),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _addNewProductProvider.setHasOnlineSell(!_addNewProductProvider.hasOnlineSell);
                      });
                    },
                    child: myRadioButton(context, value: _addNewProductProvider.hasOnlineSell),
                  )
                ],
              ),
            ],
          );
        }));
  }

}
