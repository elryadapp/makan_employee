import 'package:flutter/material.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

class MakanDivider extends StatelessWidget {
  final Color? color;
  const MakanDivider({Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color:color?? AppUi.colors.vLightGreyColor,
    );
    
  }
}
