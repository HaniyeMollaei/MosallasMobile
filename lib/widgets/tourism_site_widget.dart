import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosallas/models/tourism_site_model.dart';
import 'package:mosallas/pages/buyers/home/tourism_site.dart';
import 'package:mosallas/utils/my_style.dart';



class TourismSiteWidget extends StatefulWidget {

  TourismSiteModel tourismSite;


  TourismSiteWidget({Key key, this.tourismSite}) : super(key: key);

  @override
  State<TourismSiteWidget> createState() => _TourismSiteWidgetState();
}

class _TourismSiteWidgetState extends State<TourismSiteWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) =>   TourismSite(tourismSiteCode: widget.tourismSite.siteCode,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MyStyle.mediaQueryWidth(context, 0.04),
            vertical: MyStyle.mediaQueryHeight(context, 0.01)
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MyStyle.mediaQueryHeight(context, 0.27),
                width: MyStyle.mediaQueryWidth(context, 0.92),
                decoration: BoxDecoration(
                  color: MyStyle.headerDarkPink,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                ),
              ),
            ),
            Align(
              alignment: (widget.tourismSite.index%2==1)? Alignment.topRight: Alignment.topLeft,
              child: Container(
                height: MyStyle.mediaQueryHeight(context, 0.27),
                width: MyStyle.mediaQueryWidth(context, 0.88),
                decoration: BoxDecoration(
                  color: MyStyle.lightGrayText,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                ),
                child: Align(
                  alignment: (widget.tourismSite.index%2==1)? Alignment.centerLeft: Alignment.centerRight,
                  child: SizedBox(
                    width:MyStyle.mediaQueryWidth(context, 0.88-0.5-0.04) ,
                    child: Column(
                      children: [
                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.02),) ,
                        Text(widget.tourismSite.siteName , style: MyStyle.whiteWalletAmountStyle, textAlign: TextAlign.center,),
                        SizedBox(height: MyStyle.mediaQueryHeight(context, 0.015),) ,
                        Text(widget.tourismSite.description , style: MyStyle.whiteLightTextStyle,maxLines: 6, textAlign: TextAlign.center,),
                        const Text("..." , style: MyStyle.whiteLightTextStyle,maxLines: 6, textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: (widget.tourismSite.index%2==1)? Alignment.topRight: Alignment.topLeft,
              child: Container(
                height: MyStyle.mediaQueryHeight(context, 0.27),
                width: MyStyle.mediaQueryWidth(context, 0.5),
                decoration: BoxDecoration(
                  color: MyStyle.white,
                  borderRadius: BorderRadius.circular(MyStyle.borderRadius3),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MyStyle.mediaQueryWidth(context, 0.02),
                ),
                child: Center(
                  child: Image.asset(widget.tourismSite.imagePath , height: MyStyle.mediaQueryHeight(context, 0.23),
                    width: MyStyle.mediaQueryHeight(context, 0.23),fit: BoxFit.fill,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
