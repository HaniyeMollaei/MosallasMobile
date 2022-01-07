import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/pages/register/get_mobile_number.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';

class RegisterShopAndBuyers extends StatefulWidget {


  String type;
  RegisterShopAndBuyers({Key key,this.type}) : super(key: key);

  @override
  State<RegisterShopAndBuyers> createState() => _RegisterShopAndBuyersState();
}

class _RegisterShopAndBuyersState extends State<RegisterShopAndBuyers> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       // final userType = await StorageUtil.getDataFromSP("USER_TYPE");
        await StorageUtil.clearAllSP();
        AppConstants.clearAllConstants();
        AppConstants.setConstant(attribute: "USER_TYPE" ,choosedValue:  widget.type =="normal"? "shop":"normal" );
        await StorageUtil.setDataInSP("UserType", widget.type =="normal"? "shop":"normal");
        await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const GetPhoneNumberPage()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: MyStyle.mediaQueryWidth(context, 0.03)),
        child: Stack(
            children: [
              SvgPicture.asset('assets/svg/register_flag.svg',
              fit: BoxFit.fitWidth ,
              height: MyStyle.mediaQueryHeight(context, 0.15),
              ),
              Container(
                padding: EdgeInsets.only(left: widget.type =="normal" ? 0 :
                MyStyle.mediaQueryWidth(context, 0.02)),
                alignment: Alignment.centerLeft,
                child: Text( widget.type =="normal" ? "ثبت نام\nفروشگاه ها" : "ثبت نام\nخریداران",
                    textAlign: TextAlign.center,
                    style: MyStyle.whiteLightTextStyle),
              ),
            ]
        ),
      ),
    );
  }
}