import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_button.dart';
import 'package:makan_employee/core/utils/app_ui.dart';


class LangRow extends StatelessWidget {
  final String title;
  final String img;
  final bool isBordered;
  final Function() onTap; 
  const LangRow({Key? key,this.isBordered=false, required this.title, required this.img, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Image.asset(img,height: 4.5.h),
          SizedBox(width: 2.w,),
          Expanded(
            child: MakanButton(
              height: 4.5.h,
              onTap: onTap,
              titleColor: AppUi.colors.whiteColor,
              borderRadius: BorderRadius.circular(30),
              color:AppUi.colors.brownColor,
              title: title,
            ),
          )
        ],
      ),
    );
  }
}