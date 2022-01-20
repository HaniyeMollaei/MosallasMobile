import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/submit_button.dart';

class ShopVitrinePage extends StatefulWidget {
  ///yek response shamele 2 list --> liste avval nahayatan length=3 va shamele product haye vitrin.
  ///dovomi shamele baghie mahsoolat
  ///ba service e put call mishe moghe save

  final ShopVitrineModel shop;

  const ShopVitrinePage({
    Key key,
    this.shop,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShopVitrinePageState();
}

class ShopVitrinePageState extends State<ShopVitrinePage> {
  String shopName = "فروشگاه لباس مجلسی ایلگا";

  List<ProductModel> allProducts = [
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

  List<ProductModel> vitrineProducts = [
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
                    ///Logo --> 1.5
                    GrayAppBar(
                      pageHeaderNameLarge: widget.shop.shopName,
                      pageHeaderNameSmall: "ویترین",
                    ),

                    Stack(
                      children: [
                        SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.72),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              GridView.builder(
                                  padding: const EdgeInsets.only(top: 0),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: MyStyle.mediaQueryHeight(context, 0.32),
                                  ),
                                  itemCount: vitrineProducts.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  primary: true,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                        child: ProductWidget(
                                          p: vitrineProducts[index],
                                          onClickFunction: () {},
                                          onRemove: () {
                                            //print("Removeeeeeee");
                                            setState(() {
                                              vitrineProducts[index].isRemovable = false;
                                              allProducts.add(vitrineProducts[index]);
                                              vitrineProducts.removeAt(index);
                                            });
                                          },
                                        ));
                                  }),
                              SizedBox(
                                height: MyStyle.mediaQueryHeight(context, 0.05),
                              ),
                              GridView.builder(
                                  padding: const EdgeInsets.only(top: 0),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: MyStyle.mediaQueryHeight(context, 0.32),
                                  ),
                                  itemCount: allProducts.length,
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: true,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                        child: ProductWidget(
                                          p: allProducts[index],
                                          onClickFunction: () {
                                            print(vitrineProducts.length);
                                            setState(() {
                                              if (vitrineProducts.length < 3) {
                                                vitrineProducts.add(ProductModel(
                                                    shopCode: allProducts[index].shopCode,
                                                    star: allProducts[index].star,
                                                    cost: allProducts[index].cost,
                                                    name: allProducts[index].name,
                                                    category: allProducts[index].category,
                                                    code: allProducts[index].code,
                                                    description: allProducts[index].description,
                                                    hasOnlineSell: allProducts[index].hasOnlineSell,
                                                    imagePath: allProducts[index].imagePath,
                                                    isRemovable: true));
                                                allProducts.removeAt(index);
                                                print(vitrineProducts.length);
                                                print("add shod masalan");
                                              }
                                            });
                                          },
                                          onRemove: () {},
                                        ));
                                  }),
                              SizedBox(
                                height: MyStyle.mediaQueryHeight(context, 0.1),
                              ),
                            ],
                          ),
                        ),
                      ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(right: MyStyle.mediaQueryWidth(context, 0.1),
                              left: MyStyle.mediaQueryWidth(context, 0.1),
                              bottom: MyStyle.mediaQueryHeight(context, 0.01),),
                            child: SubmitButton(
                              text: "ذخیره ی تغییرات",
                              onPressed: (){
                                print("changes saved");
                              },
                              textSize: MyStyle.S13,
                            ),
                          ),
                        )
                      ]
                    ),
                  ],
                ),
                bottomNavigationBar: const ShopBottomNavBar(
                  index: 0,
                ))));
  }
}
