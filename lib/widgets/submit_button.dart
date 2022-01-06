import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';


class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double textSize;
  final bool isDisable;
  Color buttonColor;


  SubmitButton(
      {this.text ,  this.onPressed , this.width =0, this.height=0, this.textSize = 20,
        this.isDisable = false ,  this.buttonColor = MyStyle.headerDarkPink});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: width ==0 ? MyStyle.mediaQueryWidth(context, 0.8) : width,
        height: height ==0  ? MyStyle.mediaQueryHeight(context, 0.075) : height ,
        child:
        ElevatedButton(
          child: Text(
            text,
            style: TextStyle(
              color: MyStyle.white,
              fontFamily: MyStyle.textMediumFont,
              fontSize: textSize,
            ),
          ),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 11, horizontal: 8)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyStyle.borderRadius5))),
              foregroundColor:
              MaterialStateProperty.all<Color>(
                  isDisable ? MyStyle.disableButtonColor : MyStyle.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  isDisable ? MyStyle.backgroundColor : buttonColor)),
          onPressed: (isDisable) ? (){} : onPressed,));
  }
}