/// Author(s): Mohsen Emami && Parisa Alipajooh
/// Last Edited: 4/18/2021 11:04 AM

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_general_utils.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';
import 'package:mosallas/widgets/snackbar.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String _version = "";
  static const String _CLASS_NAME = 'Splash';
  Timer timer;
  bool connectionStatus = true;
  var appInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );

  void getInfo() async {
    var info = await PackageInfo.fromPlatform();
    setState(() {
      appInfo = info;
      _version = appInfo.version;
    });
  }

  Future startTime() async {
    timer = Timer(Duration(seconds: 5), navigateToLoginPage);
  }


  @override
  void initState() {
    startTime().then((nothing) {});
    super.initState();
    getInfo();
  }

  Future<void> navigateToLoginPage() async {
    await StorageUtil.clearAllSP();
    AppConstants.USER_TYPE = await StorageUtil.getDataFromSP("UserType") ?? "normal";
    AppConstants.getAllConstants();
    bool connectedToInternet = await MyStyle.checkConnection();
    if (connectedToInternet) {
      await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar(
          ".شما به اینترنت وصل نمی باشید",
          0,
          context));
    }
  }


  @override
  Widget build(BuildContext context) {
    print("Screen Size :");
    print("Height : "+ MyStyle.mediaQueryHeight(context, 1).toString());
    print("Width : "+ MyStyle.mediaQueryWidth(context, 1).toString());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: MyStyle.darkPink,
        body: Stack(
          children :[
            Container(
            width: MyStyle.mediaQueryWidth(context, 1),
            height: MyStyle.mediaQueryHeight(context, 1),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SvgPicture.asset('assets/svg/logo2.svg', width: MyStyle.mediaQueryWidth(context, 1) <=700 ?
              MyStyle.mediaQueryHeight(context, 0.25) : 160,),
              SizedBox(
                height: MyStyle.mediaQueryHeight(context, 0.04),
              ),
              const Text(" ${MyStyle.appName}   ", style: MyStyle.whiteHeaderStyle),

            ]),
          ),
            if (!Utils.isTextEmpty(_version)) Align(
            alignment: Alignment.bottomCenter,
            child:  Padding(
              padding: EdgeInsets.only(bottom:  MyStyle.mediaQueryHeight(context, 0.03)),
                child: Text("$_version  ورژن", style: MyStyle.lightTextStyle)),
          ) else Container()]
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
