import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

class MyTicktDataRow extends StatelessWidget {
  final IconData icon;
  final String des;
  const MyTicktDataRow({Key? key, required this.icon, required this.des}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      
                            Icon(icon,size: 2.h),
                            SizedBox(width: 1.w,),
                            AppText(des,fontSize: 2.sp,)
                            
                          ],);
                         
                        
                     
                  
  }
}