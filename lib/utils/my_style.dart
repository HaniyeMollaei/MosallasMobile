/// Author(s): Parisa Alipajooh, Ali Fathi
///Last Edited: 03/08/2021 2:13 PM

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mosallas/widgets/snackbar.dart';

class MyStyle {
  MyStyle() {
    //TODO: implement some initializations
  }

  static double mediaQueryWidth(BuildContext context, double size) {
    return MediaQuery.of(context).size.width * size;
  }

  static double mediaQueryHeight(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }

  static const String appName = "مثلث";


  static const Color disableButtonColor = Color(0xffFFB2B2);
  static const Color lightPink = Color(0xffF08D8D);
  static const Color headerDarkPink = Color(0xffE06C6C);
  static const Color darkPink = Color(0xffD25050);
  static const Color red = Color(0xffFF3434);
  static const Color green = Color(0xff4BB543);
  static const Color black = Color(0xff000000);
  static const Color darkGrayText = Color(0xff484848);
  static const Color lightGrayText = Color(0xff868686);
  static const Color backgroundColor = Color(0xffF6F4F4);
  static const Color white = Color(0xffFFFFFF);


  static const whiteHeaderStyle = TextStyle(
    fontFamily: headerFont,
    fontSize: appNameFontSize,
    color: white,
  );
  static const redHeaderStyle = TextStyle(
    fontFamily: headerFont,
    fontSize: appNameFontSize,
    color: headerDarkPink,
  );

  static const lightTextStyle = TextStyle(
      fontSize: S13,
      color: white,
    fontFamily: textLightFont
  );

  static const lightGrayTextStyle = TextStyle(
      fontSize: S13,
      color: lightGrayText,
      fontFamily: textMediumFont
  );


  static const double appNameFontSize = 30;
  static const double S13 = 13;
  static const double S15 = 15;
  static const double S16 = 16;
  static const double S17 = 17;
  static const double S18 = 18;
  static const double S20 = 20;
  static const double S22 = 22;
  static const double S40 = 40;

  static const double borderRadius1 = 8.0;
  static const double borderRadius2 = 12.0;
  static const double borderRadius3 = 16.0;
  static const double borderRadius4 = 20.0;
  static const double borderRadius5 = 40.0;


  static const String textLightFont =   'DanaLight';
  static const String textRegularFont = 'DanaRegular';
  static const String textMediumFont =  'DanaMedium';
  static const String numMediumFont =  'DanaFaNumMedium';
  static const String textBoldFont =    'DanaBold';
  static const String headerFont =      'Farnaz';
  static const String numberFont =      'Koodak';

  static final mobileNumberFormatter = new MaskTextInputFormatter(mask: '#### ### ####', filter: { "#": RegExp(r'[0-9]') });


  static Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
      // Mobile is not Connected to Internet
    } else if (connectivityResult == ConnectivityResult.mobile) {
      return true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
      // I am connected to a wifi network.
    }
    return false;
  }

  static unsuccessfulSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar(text, 0,context));
  }

  static successfulSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar(text, 1,context));
  }

  static bool isWebScreen(BuildContext context){
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if(width > 500 ){
      return true;
    }
    else{
      return false;
    }
  }

  static double screenSizeRecognization(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    return width ;
  }


}
