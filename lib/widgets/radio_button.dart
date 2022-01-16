import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';

Widget myRadioButton(BuildContext context, {bool value = false}) {
  return Container(
    height: 18,
    width: 18,
    decoration: BoxDecoration(
        color: MyStyle.white,
        borderRadius: const BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
        border: Border.all(
          color: MyStyle.headerDarkPink,
          width: 2,
        )),
    child: Center(
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: value ? MyStyle.headerDarkPink : MyStyle.white,
          borderRadius: const BorderRadius.all(Radius.circular(MyStyle.borderRadius5)),
        ),
      ),
    ),
  );
}
