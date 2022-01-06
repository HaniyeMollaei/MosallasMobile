/// Author(s): Fatemeh Fathi, Mohsen Emami,Parisa AliPajooh , Haniye Mollaei
/// Last Edited: 6/9/2020 11:55 AM
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosallas/utils/my_style.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final bool isErrorName;
  final bool isEnable;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSave;
  final ValueChanged<String> onChange;
  final ValueGetter onTap;
  final FormFieldSetter<String> onSubmit;
  final List<TextInputFormatter> inputFormatters;
  final String prefixWidget;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final double fontSize;
  final TextStyle customTextStyle;
  final double prefixSize;
  final Color bgColor;
  final Color borderColor;
  final TextAlign textAlign;
  int maxLine;
  int minLine;
  String hint;

  MyTextField(

      {
        this.textAlign = TextAlign.right,
        this.validator,
        this.onSave,
        this.onChange,
        this.prefixWidget,
        this.controller,
        this.focusNode,
        this.inputFormatters,
        this.onTap,
        this.onSubmit,
        this.suffixIcon,
        this.prefixIcon,
        this.keyboardType,
        this.fontSize,
        this.obscureText = false,
        this.customTextStyle,
        this.prefixSize,
        this.isErrorName = false,
        this.isEnable,
        this.bgColor = MyStyle.white,
        this.borderColor = Colors.transparent,
        this.maxLine = 1,
        this.minLine = 1,
        this.hint});


  ///TODO
  static const numberMapToFarsi = {0: '۰', 1: '۱', 2:'۲', 3:'۳', 4:'٤', 5:'۵', 6:'٦', 7:'۷', 8:'۸',9: '۹'};
  static const numberMapToEnglish = {0: '۰', 1: '۱', 2:'۲', 3:'۳', 4:'٤', 5:'۵', 6:'٦', 7:'۷', 8:'۸',9: '۹'};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyStyle.mediaQueryHeight(context, 0.08),
        width: MyStyle.mediaQueryWidth(context, 0.8),
        child: TextFormField(
            enabled: isEnable,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlign: textAlign,
            obscureText: obscureText ,
            focusNode: focusNode,
            autofocus: false,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            maxLines: maxLine ?? 1,
            minLines: minLine ?? 1,
            style: TextStyle(
              color: MyStyle.darkGrayText,
              fontSize: fontSize ?? MyStyle.S20,
              letterSpacing: 1,
              fontFamily: MyStyle.textMediumFont ,
            ),
            inputFormatters: inputFormatters,
            validator: validator,
            onSaved: onSave,
            onChanged: onChange,
            onTap: onTap,
            onFieldSubmitted: onSubmit,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintText: hint ?? "",
                hintStyle: const TextStyle(fontSize:  MyStyle.S17, fontFamily:
                MyStyle.textMediumFont, color: MyStyle.lightGrayText),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    style: BorderStyle.solid,
                    color: MyStyle.darkPink
                  ),
                ),
                enabledBorder:const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                  borderSide: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: MyStyle.darkPink
                  ),
                ) ,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                  borderSide: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: MyStyle.darkPink
                  ),
                ),
                border:const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
                  borderSide: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: MyStyle.darkPink
                  ),
                ),
                fillColor: bgColor,
                filled: true)));
  }
}
