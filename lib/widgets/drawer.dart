import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mosallas/state_management/bottom_sheet_listview_provider.dart';
import 'package:mosallas/utils/my_app_constants.dart';
import 'package:mosallas/utils/my_style.dart';
import 'package:mosallas/utils/storage_utils.dart';
import 'package:mosallas/widgets/bottom_sheet.dart';
import 'package:mosallas/widgets/bottom_sheet_list_item.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  List content;
  String text;
  String attribute;
  MyDrawer({Key key, this.content, this.text , this.attribute}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  BottomSheetListviewProvider _bottomSheetListviewProvider = new BottomSheetListviewProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _bottomSheetListviewProvider = Provider.of<BottomSheetListviewProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await MyBottomSheet(
            context: context,
            hasButton: true,
            hasCancel: true,
            buttonPressedDo: () async {
              Navigator.of(context).pop();
              await StorageUtil.setDataInSP(widget.attribute,_bottomSheetListviewProvider.choosedValue );
              AppConstants.setConstant(attribute:widget.attribute , choosedValue: _bottomSheetListviewProvider.choosedValue  );
              AppConstants.getAllConstants();
            },
            content: SizedBox(
              height: MyStyle.mediaQueryHeight(context, 0.7),
              child: Consumer<BottomSheetListviewProvider>(builder: (_, __, ___) {
                return ListView.builder(
                    itemCount: widget.content.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            _bottomSheetListviewProvider.setChoosedValue( widget.content[index]);
                            _bottomSheetListviewProvider.setChoosedValueIndex(index);
                          },
                          child: BottomSheetListItem(
                            index:index,
                            value: widget.content[index],
                            choosed: _bottomSheetListviewProvider.choosedValueIndex
                          ));
                    });
              }),
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: MyStyle.mediaQueryWidth(context, 0.02)),
        height: MyStyle.mediaQueryHeight(context, 0.05),
        width: MyStyle.mediaQueryWidth(context, 0.4),
        decoration: const BoxDecoration(
          color: MyStyle.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SvgPicture.asset(
            'assets/svg/bottom_arrow.svg',
          ),
          Text(widget.text, textAlign: TextAlign.end, style: MyStyle.lightGrayTextStyle),
        ]),
      ),
    );
  }
}
