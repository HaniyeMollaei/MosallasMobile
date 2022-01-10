import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/utils/my_style.dart';

class BottomSheetListItem extends StatefulWidget {
  const BottomSheetListItem({Key key , this.value, this.choosed, this.index}) : super(key: key);

  final int index;
  final String value;
  final int choosed;
  @override
  State<BottomSheetListItem> createState() => _BottomSheetListItemState();
}

class _BottomSheetListItemState extends State<BottomSheetListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyStyle.white,
      height: MyStyle.mediaQueryHeight(context, 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MyStyle.mediaQueryWidth(context, 0.02),
          ),
          SizedBox(
            height: MyStyle.mediaQueryWidth(context, 0.08),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (widget.choosed != null && widget.choosed == widget.index) ? SvgPicture.asset('assets/svg/tick.svg',
                    height: 16) : Container(),
                Padding(
                  padding:  const EdgeInsets.only(right: 8.0 , left:8.0),
                  child: Text(widget.value.toString(), style: MyStyle.lightGrayTextStyleS13),
                ),


              ],
            ),
          ),
          Container(height: 1,
            color: MyStyle.lightGrayText.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
