/// Author(s): Fa Rahimian
/// Last Edited: 8/17/2021 01:00 PM
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/utils/my_style.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static Color detectColor(int type) {
    switch (type) {
      case 0:
        {
          return MyStyle.red;
        }
        break;

      case 1:
        {
          return MyStyle.green;
        }
        break;
      case 2:
        {
          return Colors.black;
        }
        break;

      default:
        {
          return Colors.green;
        }
        break;
    }
  }

  static buildSnackbar(BuildContext context, String message, int type) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3, milliseconds: 300),
        padding: EdgeInsets.all(0),
        backgroundColor: type == 1 ? MyStyle.green : MyStyle.red,
        content: Container(padding: EdgeInsets.all(15.0), child: Text("$message")),
      ),
    );
  }

  static SnackBar snackBar(String message, int type, BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    bool isBigScreen;
    w > 600 ? isBigScreen = true : isBigScreen = false;
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3, milliseconds: 700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      // backgroundColor: type == 1 ? MyStyle.green : MyStyle.red,
      backgroundColor: detectColor(type),
      // padding: EdgeInsets.symmetric(vertical: w * 0.04),
      margin: isBigScreen ? EdgeInsets.only(right: w * 0.2, left: w * 0.2, bottom: h * 0.0125) : null,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              height: isBigScreen ? w * 0.035 : w * 0.075,
              width: isBigScreen ? w * 0.035 : w * 0.075,
              margin: EdgeInsets.only(left: w * 0.05),
              child: AspectRatio(
                aspectRatio: 1,
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(seconds: 4),
                    builder: (context, double value, _) {
                      // This varriable is the number inside the progress bar
                      var timer = value * 100 < 25
                          ? 4
                          : 25 <= (value * 100) && (value * 100) < 50
                              ? 3
                              : 50 <= (value * 100) && (value * 100) < 75
                                  ? 2
                                  : 75 <= (value * 100) && (value * 100) < 100
                                      ? 1
                                      : 0;

                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: 1 - value,
                            color: MyStyle.white,
                            backgroundColor: MyStyle.white.withOpacity(0.3),
                          ),
                          Center(
                              child: Text(
                            (timer).toString(),
                            style: TextStyle(
                                color: MyStyle.white,
                                fontSize: isBigScreen ? w * 0.0125 : w * 0.035,
                                fontWeight: FontWeight.bold),
                          ))
                        ],
                      );
                    }),
              )),
          Container(
              width: isBigScreen ? w * 0.4 : w * 0.6,
              margin: EdgeInsets.only(left: w * 0.06),
              child: Text(
                "$message",
                style: TextStyle(
                    color: MyStyle.white, fontSize: isBigScreen ? w * 0.0125 : w * 0.03, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
