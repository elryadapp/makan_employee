import 'package:flutter/material.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

 class AppText extends StatelessWidget {
  final String text;
  final TextDecoration? textDecoration;
  final  Color? color;
  final Color? decorationColor;
  final  FontWeight? fontWeight;
  final  double? fontSize;
  final  double? height;
  final  int? maxLines;
  final  TextAlign? textAlign;
  final  TextOverflow? textOverflow;

  const AppText(this.text,{Key? key, this.textDecoration,this.color, this.fontWeight, this.fontSize, this.height, this.maxLines, this.textAlign, this.textOverflow, this.decorationColor, }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Text(text,
    style:TextStyle(
      color: color??AppUi.colors.darkGreyColor,
      fontWeight: fontWeight,
      fontFamily: 'Poppins_Regular',
      decoration:textDecoration??TextDecoration.none ,
      decorationColor:decorationColor??AppUi.colors.darkGreyColor,
      height: height??1.2,
      fontSize: fontSize??3.sp,
    ),
    overflow:textOverflow,
    maxLines:maxLines,
    textAlign: textAlign,
    
    );
  }
} 
