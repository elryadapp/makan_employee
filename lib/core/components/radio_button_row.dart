
import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

class RadioButtonRow extends StatelessWidget {
  final String title;
  final Color selectedColor;
  final Function()ontap;
  const RadioButtonRow({ Key? key, required this.title, required this.ontap, required this.selectedColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
        return InkWell(
          onTap: ontap,
          child: Row(
         children: [
           Container(
           padding: const EdgeInsets.all(2),
          
           width: 4.w,
           height: 4.h,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            border: Border.all(color: AppUi.colors.shimmerBaseColor)
          ),
           child: CircleAvatar(
             backgroundColor: selectedColor,
           ),
           ),
          const SizedBox(width: 10,),
           AppText(title,fontSize: 2.2.sp,)
         ],
          ),
        
      
    );
  }
}