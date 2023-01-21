import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/animated_commponent.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/constants.dart';


class MakanFooter extends StatelessWidget {
  final bool isSFooter;
  const MakanFooter({Key? key,  this.isSFooter=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MakanSlideAnimation(
      horizontalOffset: 0,
      verticalOffset: 100,
      child: SizedBox(
        height: isSFooter?8.h:12.h,
        width: Constants.getwidth(context),
        child: Image.asset( AppUi.assets.footer,fit: BoxFit.fitWidth,alignment: Alignment.topCenter,)));
  }
}