import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:makan_employee/core/components/drawer_container.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/constants.dart';

class MakanDrawer extends StatefulWidget {
  final Widget mainScreen;
  const MakanDrawer({
    Key? key,
    required this.mainScreen,
  }) : super(key: key);

  @override
  State<MakanDrawer> createState() => _MakanDrawerState();
}

class _MakanDrawerState extends State<MakanDrawer> {
  @override
  void initState() {
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
      controller:MakanCubit.get(context).zoomDrawerController ,
            angle: 0.0,
            isRtl: Constants.lang=='ar',
           boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: AppUi.colors.lightGreyColor.withOpacity(.5)
            )
           ],
            mainScreenAbsorbPointer: false,
            disableDragGesture: true,
            slideWidth: MediaQuery.of(context).size.width * 0.6,
            mainScreenScale: .01,
            menuScreen: const DrawerContainer(),
            mainScreen: Container(
              color: AppUi.colors.bgColor,
              child: widget.mainScreen));
  }
}
