
import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/constants.dart';



class MakanButton extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final Widget? titleWidget;
  final Color? color, titleColor;
  final double? width, height, fontSize ;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  const MakanButton(
      {Key? key, this.onTap,
      this.color,
      this.titleColor ,
      this.title,
      this.height,
      this.width,
      this.fontSize ,
      this.borderRadius,
      this.titleWidget, this.border }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: width ?? Constants.getwidth(context),
        height: height ?? 4.5.h,
        decoration: BoxDecoration(
            
          color: color??AppUi.colors.brownColor ,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(30.0),
        ),
        child: Center(
            child: title == null
                ? titleWidget
                : AppText(
                    title!,

                    fontSize: fontSize??2.5.sp,
                    fontWeight: FontWeight.bold,
                    color: titleColor??AppUi.colors.whiteColor,
                  )),
      ),
    );
  }
}
