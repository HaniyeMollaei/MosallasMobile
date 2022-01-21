import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/state_management/add_new_product_provider.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/drawer.dart';
import 'package:mosallas/widgets/empty_photo.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/radio_button.dart';
import 'package:mosallas/widgets/submit_button.dart';
import 'package:mosallas/widgets/text_field.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  final String shopCode;
  final bool isFavorite;
  final bool isBuyer;
  final bool isShop;
  final bool isShopVitrine;
  const AllProducts(
      {Key key,
      this.shopCode,
      this.isFavorite = false,
      this.isBuyer = true,
      this.isShop = false,
      this.isShopVitrine = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AllProductsState();
}

class AllProductsState extends State<AllProducts> {
  String shopName = "فروشگاه لباس مجلسی ایلگا";
  Uint8List uploadedImage;
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
                    pageHeaderNameLarge: widget.isFavorite ? "موارد مورد علاقه" : shopName,
                    pageHeaderNameSmall: widget.isFavorite ? "" : "تمامی محصولات موجود در",
                  ),

                  widget.isShop
                      ? SubmitButton(
                          height: MyStyle.mediaQueryHeight(context, 0.06),
                          width: MyStyle.mediaQueryWidth(context, 0.92),
                          text: "   افزودن محصول جدید   ",
                          textSize: MyStyle.S13,
                          onPressed: addNewProductPhoto,
                        )
                      : Container(),
                  widget.isShop
                      ? SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.02),
                        )
                      : Container(),

                  SingleChildScrollView(
                    child: SizedBox(
                      height: MyStyle.mediaQueryHeight(context, widget.isShop ? 0.64 : 0.72),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: MyStyle.mediaQueryHeight(context, 0.32),
                          ),
                          itemCount: widget.isFavorite
                              ? favorites.length
                              : widget.isShop
                                  ? shopProducts.length
                                  : myProducts.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                child: ProductWidget(
                                  p: widget.isFavorite
                                      ? favorites[index]
                                      : widget.isShop
                                          ? shopProducts[index]
                                          : myProducts[index],
                                  onRemove: widget.isFavorite
                                      ? () {
                                          print("Removeeeeeee");
                                          setState(() {
                                            favorites.removeAt(index);
                                          });
                                        }
                                      : widget.isShop
                                          ? () {
                                              print("Removeeeeeee");
                                              onShopProductDelete(index);
                                            }
                                          : () {},
                                ));
                          }),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: widget.isShopVitrine
                  ? const ShopBottomNavBar(
                      index: 0,
                    )
                  : widget.isShop
                      ? const ShopBottomNavBar(
                          index: 2,
                        )
                      : BuyerBottomNavBar(
                          index: widget.isFavorite ? 3 : 2,
                        ),
            )));
  }

  Widget onShopProductDelete(int index) {
    print("what happenssss");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
            shopProducts.removeAt(index);
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
    print("addNewProductPhoto");
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
                  _addNewProductProvider.image == null
                      ? emptyPhoto(
                          context: context,
                          h: MyStyle.mediaQueryWidth(context, 0.5),
                          w: MyStyle.mediaQueryWidth(context, 0.5),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                          child: kIsWeb
                              ? Image.network(_addNewProductProvider.image.path,
                                  height: MyStyle.mediaQueryWidth(context, 0.5),
                                  width: MyStyle.mediaQueryWidth(context, 0.5),
                                  fit: BoxFit.fitWidth)
                              : Image.file(
                                  File(_addNewProductProvider.image.path),
                                  height: MyStyle.mediaQueryWidth(context, 0.5),
                                  width: MyStyle.mediaQueryWidth(context, 0.5),
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                  InkWell(
                    onTap: () async {
                      final i = await _picker.pickImage(source: ImageSource.gallery);
                      _addNewProductProvider.setImage(i);
                      setState(() {});
                      print(i.path);
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
                text: "دسته بندی",
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
        onButtonPressed: () {
          print("New Product added to list");
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

  List<ProductModel> myProducts = [
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg', 'assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: false,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: false,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: false,
        star: 4.5,
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        imagePath: ['assets/image/12.jpg'],
        isRemovable: false,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: true,
        category: "پوشاک",
        star: 4.5,
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg'],
        isRemovable: false,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        hasOnlineSell: true,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        isRemovable: false,
        star: 4.5,
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/12.jpg'],
        isRemovable: false,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        imagePath: ['assets/image/5.jpg'],
        isRemovable: false,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/6.jpg'],
        isRemovable: false,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/12.jpg'],
        isRemovable: false,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "kghd13224"),
  ];

  List<ProductModel> favorites = [
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg', 'assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: true,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: false,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: true,
        star: 4.5,
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        imagePath: ['assets/image/12.jpg'],
        isRemovable: true,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: true,
        category: "پوشاک",
        star: 4.5,
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg'],
        isRemovable: true,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        hasOnlineSell: true,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        isRemovable: true,
        star: 4.5,
        shopCode: "hfgds43"),
  ];

  List<ProductModel> shopProducts = [
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg', 'assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: true,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: false,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        isRemovable: true,
        star: 4.5,
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        imagePath: ['assets/image/12.jpg'],
        isRemovable: true,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        hasOnlineSell: true,
        category: "پوشاک",
        star: 4.5,
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        imagePath: ['assets/image/5.jpg'],
        isRemovable: true,
        star: 4.5,
        hasOnlineSell: true,
        category: "پوشاک",
        shopCode: "hfgds43"),
    ProductModel(
        name: "پیراهن آستین بلند مردانه",
        code: "hgd65435hj",
        cost: 123000,
        hasOnlineSell: true,
        category: "پوشاک",
        imagePath: ['assets/image/6.jpg', 'assets/image/12.jpg'],
        description: "طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
        isRemovable: true,
        star: 4.5,
        shopCode: "hfgds43"),
  ];
}
