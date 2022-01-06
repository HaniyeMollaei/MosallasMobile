import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class LargeLogo extends StatefulWidget {
  const LargeLogo({Key key}) : super(key: key);


  @override
  State<LargeLogo> createState() => _LargeLogoState();
}

class _LargeLogoState extends State<LargeLogo> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: MyStyle.mediaQueryHeight(context, 0.28),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         SvgPicture.asset('assets/svg/logo.svg',
             height: MyStyle.mediaQueryHeight(context, 0.18) ),
         SizedBox(
           height: MyStyle.mediaQueryHeight(context, 0.03),
         ),
         const Text(" ${MyStyle.appName}   ", style: MyStyle.redHeaderStyle),
         SizedBox(
           height: MyStyle.mediaQueryHeight(context, 0.02),
         ),
       ],
     ),
   );
  }
}
