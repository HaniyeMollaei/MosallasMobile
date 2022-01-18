import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/models/product_model.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/bottom_nav_bar_shop.dart';
import 'package:mosallas/widgets/product.dart';
import 'package:mosallas/widgets/submit_button.dart';

class AllProducts extends StatefulWidget {
  final String shopCode;
  final bool isFavorite;
  final bool isBuyer;
  final bool isShop;
  const AllProducts({Key key, this.shopCode, this.isFavorite = false, this.isBuyer = true, this.isShop = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllProductsState();
}

class AllProductsState extends State<AllProducts> {

  String shopName = "فروشگاه لباس مجلسی ایلگا";
  List<ProductModel> myProducts;
  List<ProductModel> favorites;

  @override
  Widget build(BuildContext c) {
    myProducts = [
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/5.jpg','assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: false,
          category: "پوشاک",
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: true,
          category: "پوشاک",
          star: 4.5,
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/5.jpg'],
          isRemovable: false,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          hasOnlineSell: true,
          category: "پوشاک",
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          isRemovable: false,
          star: 4.5,
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath:[ 'assets/image/5.jpg'],
          isRemovable: false,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/6.jpg'],
          isRemovable: false,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/12.jpg'],
          isRemovable: false,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "kghd13224"
      ),
    ];


    favorites = [
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          imagePath: ['assets/image/5.jpg','assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: true,
          star: 4.5,
          hasOnlineSell: true,
          category: "پوشاک",
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: false,
          category: "پوشاک",
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          isRemovable: true,
          star: 4.5,
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          imagePath: ['assets/image/12.jpg'],
          isRemovable: true,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          hasOnlineSell: true,
          category: "پوشاک",
          star: 4.5,
          shopCode: "hfgds43"),
      ProductModel(
          name: "پیراهن آستین بلند مردانه",
          code: "hgd65435hj",
          cost: 123000,
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
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
          imagePath: ['assets/image/6.jpg','assets/image/12.jpg'],
          description:"طرح: طرح‌دار، ساده\nقد: زیر زانو\nیقه: هفت\nآستین: سه ربع\nنوع پایین تنه: دامن",
          isRemovable: true,
          star: 4.5,
          shopCode: "hfgds43"),
    ];


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
                    pageHeaderNameLarge: widget.isFavorite? "موارد مورد علاقه" :shopName,
                    pageHeaderNameSmall: widget.isFavorite? "":"تمامی محصولات موجود در",
                  ),
                  widget.isShop ? SubmitButton(
                    height: MyStyle.mediaQueryHeight(context, 0.06),
                    width: MyStyle.mediaQueryWidth(context, 0.92),
                    text: "افزودن محصول جدید",
                    textSize: MyStyle.S15,
                    onPressed: (){},
                  ): Container(),
                  widget.isShop ? SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.02),
                  ):Container(),

                  SingleChildScrollView(
                    child: SizedBox(
                      height: MyStyle.mediaQueryHeight(context, widget.isShop ? 0.64:0.72),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: MyStyle.mediaQueryHeight(context, 0.32),
                          ),
                          itemCount: widget.isFavorite ? favorites.length : myProducts.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
                                child: ProductWidget(
                                  p:  widget.isFavorite ? favorites[index] : myProducts[index],
                                  onRemove: widget.isFavorite ? (){
                                    print("Removeeeeeee");
                                    setState(() {
                                      favorites.removeAt(index);
                                    });
                                } : (){},
                                ));
                          }),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar:widget.isShop ? ShopBottomNavBar(index: 2,): BuyerBottomNavBar(
                index: widget.isFavorite? 3 : 2,
              ),
            )));
  }
}
