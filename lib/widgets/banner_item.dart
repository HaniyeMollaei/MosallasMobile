import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/banner_model.dart';
import 'package:mosallas/utils/my_general_utils.dart';
import 'package:mosallas/utils/my_style.dart';

Widget bannerItemWidget({
  BuildContext context,
  BannerModel bannerItem,
}) {
  Widget header = Align(
    alignment: Alignment.topCenter,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
      child: Image.asset(
        bannerItem.image,
        height: MyStyle.mediaQueryHeight(context, 0.22),
        width: MyStyle.mediaQueryWidth(context, 0.88) ,
        fit: BoxFit.cover
      ),
    ),
  );

  return InkWell(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
      child: Stack(
        children: [
          ///products
          Center(
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.38),
              width: MyStyle.mediaQueryWidth(context, 0.88),
              decoration: BoxDecoration(
                color:MyStyle.white,
                borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MyStyle.mediaQueryHeight(context, 0.01),
                    left: MyStyle.mediaQueryWidth(context, 0.04),
                    right:  MyStyle.mediaQueryWidth(context, 0.04)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "تومان",
                                style: MyStyle.darkTextStyleS13,
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                " ${bannerItem.bannerCost.toString()}",
                                style: MyStyle.darkTextStyleS13,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          const Text(
                            "هزینه ی پرداخت شده",
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.005),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bannerItem.createDate.toString(),
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                          const Text(
                            "تاریخ ثبت بنر",
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.005),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Utils.isTextEmpty(bannerItem.showDate.toString()) ?"هنوز نمایش داده نشده است":bannerItem.showDate,
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                          const Text(
                            "تاریخ نمایش بنر",
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyStyle.mediaQueryHeight(context, 0.005),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bannerItem.status == "WAIT" ? "در انتظار تایید" : bannerItem.status == "SHOW" ? "نمایش داده شده است":"_",
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                          const Text(
                            "وضعیت سفارش بنر",
                            style: MyStyle.darkTextStyleS13,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

          ///widget header
          header,
        ],
      ),
    ),
  );
}
