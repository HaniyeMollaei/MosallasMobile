import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/submit_button.dart';

Future MyBottomSheet({
  BuildContext context,
  Widget content,
  bool hasButton = false,
  String buttonText = "ذخیره",
  Function buttonPressedDo,
  bool hasCancel = false,
  String cancelText = "انصراف",
  Function cancelPressedDo,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: MyStyle.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(MyStyle.borderRadius3),
        topRight: Radius.circular(MyStyle.borderRadius3),
      )),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SafeArea(
            top: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MyStyle.mediaQueryHeight(context, 0.9),
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MyStyle.mediaQueryHeight(context, 0.04),
                          bottom: MyStyle.mediaQueryHeight(context, 0.02),
                          left: MyStyle.mediaQueryWidth(context, 0.06),
                          right: MyStyle.mediaQueryWidth(context, 0.06)),
                      child: Column(children: [
                        SingleChildScrollView(child: content),
                        SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.04),
                        ),
                        hasButton
                            ? SubmitButton(
                          textSize: MyStyle.S13,
                                text: buttonText,
                                onPressed: buttonPressedDo,
                                height: MyStyle.mediaQueryHeight(context, 0.06),
                          width: MyStyle.mediaQueryWidth(context, 0.6),
                              )
                            : Container(),
                        SizedBox(
                          height: MyStyle.mediaQueryHeight(context, 0.02),
                        ),
                        hasCancel
                            ? InkWell(
                                onTap: cancelPressedDo ??
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                child: Text(
                                  cancelText,
                                  style: MyStyle.lightPinkTextStyle,
                                ))
                            : Container(),
                      ])),
                ),
              ),
            ),
          ),
        );
      });
}
