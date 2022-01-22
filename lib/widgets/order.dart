import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/address.dart';
import 'package:mosallas/models/order_model.dart';
import 'package:mosallas/utils/my_style.dart';

Widget orderItemWidget({
  BuildContext context,
  OrderModel orderItem,
  bool isGray = true,
  Function onTap,
}) {
  Widget header = Align(
    alignment: Alignment.topCenter,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MyStyle.mediaQueryWidth(context, 0.04), vertical: MyStyle.mediaQueryHeight(context, 0.02)),
      height: MyStyle.mediaQueryHeight(context, 0.3),
      width: MyStyle.mediaQueryWidth(context, 0.88),
      decoration: BoxDecoration(
        color: isGray ? MyStyle.backgroundColor : MyStyle.white,
        borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
      ),
      child: Column(
        children: [
          Text(
            orderItem.productName,
            style: MyStyle.darkTextStyleS13,
            textAlign: TextAlign.end,
          ),
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
                    " ${orderItem.productCost.toString()}",
                    style: MyStyle.darkTextStyleS13,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              Text(
                orderItem.productCode,
                style: MyStyle.darkTextStyleS13,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderItem.orderDate.toString(),
                style: MyStyle.darkTextStyleS13,
                textAlign: TextAlign.start,
              ),
              Text(
                orderItem.orderCode,
                style: MyStyle.darkTextStyleS13,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              orderItem.shopName,
              style: MyStyle.darkTextStyleS13,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              orderItem.shopPhoneNumber,
              style: MyStyle.darkTextStyleS13,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: MyStyle.mediaQueryHeight(context, 0.01),
          ),
          SizedBox(
            width: MyStyle.mediaQueryWidth(context, 0.8),
            child: Text(
              AddressModel.makeAddressString(orderItem.shopAddress),
              maxLines: 2,
              style: MyStyle.darkTextStyleS13,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );

  return InkWell(
    onTap: onTap ?? () async {},
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: MyStyle.mediaQueryHeight(context, 0.01)),
      child: Stack(
        children: [
          ///products
          Center(
            child: Container(
              height: MyStyle.mediaQueryHeight(context, 0.34),
              width: MyStyle.mediaQueryWidth(context, 0.88),
              decoration: BoxDecoration(
                color: orderItem.orderStatus == "Sent" ? MyStyle.green : MyStyle.headerDarkPink,
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
                  padding: EdgeInsets.only(bottom: MyStyle.mediaQueryHeight(context, 0.005)),
                  child: Text(
                    orderItem.orderStatus == "WaitForShop"
                        ? "در انتظار رسیدگی فروشنده"
                        : orderItem.orderStatus == "Sent"
                            ? ".سفارش شما ارسال شده است"
                            : ".فروشنده سفارش شما را دریافت کرده است",
                    style: MyStyle.whiteMediumTextStyle,
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
