import 'package:flutter/material.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

class MakanVerticalDivider extends StatelessWidget {
  const MakanVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppUi.colors.lightGreyColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20)
      ),
      height: 3.h,
      width: .5.w,
    );
  }
}