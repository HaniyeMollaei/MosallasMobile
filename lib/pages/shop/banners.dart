
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mosallas/models/banner_model.dart';
import 'package:mosallas/models/shop_vitrine_model.dart';
import 'package:mosallas/state_management/banner_provider.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/appbar_gray.dart';
import 'package:mosallas/widgets/banner_item.dart';
import 'package:mosallas/widgets/dialoug.dart';
import 'package:mosallas/widgets/empty_photo.dart';
import 'package:mosallas/widgets/text_field.dart';
import 'package:provider/provider.dart';

class BannersPage extends StatefulWidget {
  final bool isForShop;
  const BannersPage({Key key, this.isForShop}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BannersPageState();
}

class BannersPageState extends State<BannersPage> {

  final TextEditingController _txtDescription = TextEditingController();
  final FocusNode _fndDescription = FocusNode();

  List<BannerModel> banners = [
    BannerModel(
    bannerCost: 500000,
      createDate: "1400/10/03",
      showDate: "1400/10/15",
      descriptionForAdmin: "لطفا در صورتی که مشکل داشت بهم پیام بدین",
      image: "assets/image/off50.jpg",
      status: "SHOW"
  ),
    BannerModel(
        bannerCost: 500000,
        createDate: "1400/10/03",
        showDate: "",
        descriptionForAdmin: "لطفا در صورتی که مشکل داشت بهم پیام بدین",
        image: "assets/image/man_off.jpg",
        status: "WAIT"
    )
  ];
  final ImagePicker _picker = ImagePicker();
  BannerProvider _bannerProvider = new BannerProvider();

  ShopVitrineModel shop = ShopVitrineModel(
      shopName: "فروشگاه لباس مجلسی ایلگا",
      address: "خیابان سعدی وسط، خیابان زینبیه، کوچه ی امید، پلاک 143",
      shopCode: "mnb876gi99",
      phoneNumber: "09123456789",
      shippingCost: 12000,
      star: 4.3,
      shopImagePath: "assets/image/ilga.jpg",
      productsImagePath: ["assets/image/6.jpg", "assets/image/12.jpg"]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _bannerProvider = Provider.of<BannerProvider>(context, listen: false);
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
                  ///Logo --> 1.8
                  const GrayAppBar(
                    pageHeaderNameSmall: "",
                    pageHeaderNameLarge: "سفارشات",
                  ),
                  widget.isForShop
                      ? InkWell(
                    onTap: addNewBannerPhoto,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                        color: MyStyle.headerDarkPink,
                      ),
                      height: MyStyle.mediaQueryHeight(context, 0.06),
                      width: MyStyle.mediaQueryWidth(context, 0.92),
                      child: const Center(
                        child: Text(
                          "افزودن بنر جدید",
                          style: TextStyle(fontSize: MyStyle.S15, fontFamily: MyStyle.textRegularFont, color: MyStyle.white),
                        ),
                      ),
                    ),
                  )
                      : Container(),
                  widget.isForShop
                      ? SizedBox(
                    height: MyStyle.mediaQueryHeight(context, 0.02),
                  )
                      : Container(),

                  SizedBox(
                    height: MyStyle.mediaQueryHeight(context, widget.isForShop ? 0.74 : 0.8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///0.72-0.37
                          ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              shrinkWrap: true,
                              itemExtent: null,
                              physics: const BouncingScrollPhysics(),
                              itemCount: banners.length,
                              itemBuilder: (BuildContext c, int index) {
                                return bannerItemWidget(context: c,bannerItem: banners[index]) ;
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // bottomNavigationBar: widget.isForShop
              //     ? const ShopBottomNavBar(
              //   index: 1,
              // )
              //     : Container(),
            )));
  }

  Widget addNewBannerPhoto() {
    print("addNewProductPhoto");
    return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.92),
        height: MyStyle.mediaQueryHeight(context, 0.47),
        hasCancel: true,
        hasButton: true,
        buttonText: "ادامه",
        hasHeader: true,
        headerText: "بارگذاری بنر برای تبلیغ فروشگاه",
        context: context,
        onButtonPressed: () async {
          print("Banner saved");
          Navigator.of(context).pop();
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            bannerPayment();
          });
        },
        content: Consumer<BannerProvider>(builder: (_, __, ___) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bannerProvider.image == null
                      ? emptyPhoto(
                    context: context,
                    h: MyStyle.mediaQueryWidth(context, 0.3),
                    w: MyStyle.mediaQueryWidth(context, 0.5),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(MyStyle.borderRadius4),
                    child: kIsWeb
                        ? Image.network(_bannerProvider.image.path,
                        height: MyStyle.mediaQueryWidth(context, 0.3),
                        width: MyStyle.mediaQueryWidth(context, 0.5),
                        fit: BoxFit.fitWidth)
                        : Image.memory(
                      _bannerProvider.uploadedImage,
                      height: MyStyle.mediaQueryWidth(context, 0.3),
                      width: MyStyle.mediaQueryWidth(context, 0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final i = await _picker.pickImage(source: ImageSource.gallery);
                      final v = await i.readAsBytes();
                      _bannerProvider.setUploadedImage(v);
                      _bannerProvider.setImage(i);
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

  Widget bannerPayment() {
    //  print("addNewProductPhoto");
    return myDialog(
        width: MyStyle.mediaQueryWidth(context, 0.92),
        height: MyStyle.mediaQueryHeight(context, 0.63),
        hasCancel: true,
        hasButton: true,
        buttonText: "پرداخت با کیف پول",
        hasHeader: true,
        headerText: "بارگذاری بنر برای تبلیغ فروشگاه",
        context: context,
        onButtonPressed: () async {
          print("Banner saved");
          Navigator.of(context).pop();
          // WidgetsBinding.instance.addPostFrameCallback((_) async {
          //   getNewProductInformation();
          // });
        },
        content: Consumer<BannerProvider>(builder: (_, __, ___) {
          return Column(
            children: [
              const Text("هزینه ی درج بنر در صفحه ی اصلی مشتریان، برای 2 روز در شهرستان شما 500,000 میباشد.در صورت عدم تایید بنر این هزینه به حساب شما باز خواهد گشت",
                  textAlign: TextAlign.right, style: MyStyle.darkTextStyleS13),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.01),
              ),
              MyTextField(
                width: MyStyle.mediaQueryWidth(context, 0.84),
                height: MyStyle.mediaQueryHeight(context, 0.18),
                isGray: true,
                textAlign: TextAlign.right,
                hint: "...توضیحات",
                keyboardType: TextInputType.text,
                maxLine: 5,
                fontSize: MyStyle.S13,
                minLine: 5,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(250),
                ],
                onSubmit: (String v) {
                  FocusScope.of(context).unfocus();
                },
                controller: _txtDescription,
                focusNode: _fndDescription,
              ),
            ],
          );
        }));
  }

}
