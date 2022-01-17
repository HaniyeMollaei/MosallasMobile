import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/widgets/submit_button.dart';

myDialog({
  BuildContext context,
  double height,
  double width,
  bool hasHeader = false,
  String headerText,
  bool hasButton = false,
  String buttonText,
  Function onButtonPressed,
  bool hasCancel = false,
  String cancelText = "انصراف",
  Function onCancelPressed,
  Widget content,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(MyStyle.borderRadius3))),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                SizedBox(
                  height: height ?? MyStyle.mediaQueryHeight(context, 0.4),
                  width: width ?? MyStyle.mediaQueryWidth(context, 0.96),
                  child: Material(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      color: MyStyle.white,
                      type: MaterialType.card,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.06)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            hasHeader? SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.02),
                            ):Container(),
                            hasHeader? Text(
                              headerText,
                              style: MyStyle.redMediumHeaderStyle,
                            ):Container(),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.02),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.02,
                                right: 15,
                              ),
                              child: content,
                            ),
                            SizedBox(
                              height: MyStyle.mediaQueryHeight(context, 0.02),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                hasButton
                                    ? SubmitButton(
                                        text: buttonText,
                                        onPressed: onButtonPressed,
                                      )
                                    : Container(),
                                hasButton
                                    ? SizedBox(
                                        height: MyStyle.mediaQueryHeight(context, 0.02),
                                      )
                                    : Container(),
                                hasCancel
                                    ? InkWell(
                                        onTap: onCancelPressed ?? (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          cancelText ?? "انصراف",
                                          style: MyStyle.lightGrayTextStyleS13,
                                        ),
                                      )
                                    : Container(),
                                hasCancel
                                    ? SizedBox(
                                        height: MyStyle.mediaQueryHeight(context, 0.03),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
