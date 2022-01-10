import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class LoginRegisterBottom extends StatefulWidget {
   String text;
   VoidCallback onPressed;


    LoginRegisterBottom({Key key, this.text, this.onPressed }) : super(key: key);

  @override
  State<LoginRegisterBottom> createState() => _LoginRegisterBottomState();
}

class _LoginRegisterBottomState extends State<LoginRegisterBottom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [ SvgPicture.asset('assets/svg/poly.svg',
          width:  MyStyle.mediaQueryWidth(context, 1)
        ),
          Container(
            padding: EdgeInsets.only(top: MyStyle.mediaQueryHeight(context, 0.02)),
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: widget.onPressed,
                child:  Text(widget.text,
                    style: MyStyle.lightGrayTextStyleS13)),
          ),
        ]
    );
  }
}