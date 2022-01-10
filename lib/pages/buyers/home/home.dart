import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/bottom_nav_bar_buyer.dart';
import 'package:mosallas/widgets/logo_medium.dart';

class BuyerHome extends StatefulWidget{
  const BuyerHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BuyerHomeState();

}

class BuyerHomeState extends State<BuyerHome>{

  @override
  Widget build(BuildContext c) {
    return SafeArea(
        top: false,
        bottom: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset : false,
              backgroundColor: MyStyle.backgroundColor,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ///0.15
                    Column(
                      children: [

                        ///Logo --> 1.8
                        const MediumLogo(finalType: "location",),


                        ///0.04
                        SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.02),
                        ),


                      ],
                    ),


                  ]),
              bottomNavigationBar: BuyerBottomNavBar(index: 0,),
            ))) ;
  }

}