import 'dart:async';

import 'package:flutter/material.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation? _logoAnimation;
  AnimationController? _logoController;

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 2),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController!,
      curve: Curves.easeIn,
    );

    _logoAnimation!.addListener(() {
      if (_logoAnimation!.status == AnimationStatus.completed) {
        return;
      }
      setState(() {});
    });

    _logoController!.forward();
    super.initState();
    startTime();
  }

 

  Future<void> navigationPage() async {
    if (Constants.token== null) {
     Navigator.pushReplacementNamed(
        context, Routes.selectLanguage);
    } else {
      Navigator.pushReplacementNamed(
        context, Routes.mainServices);
    }
 
  }

  startTime() async {
    Duration duration = const Duration(seconds: 3);
    return  Timer(duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
      child: SizedBox(
        height: _logoAnimation!.value*250.0,
        width: _logoAnimation!.value*250.0,
        child:Image.asset(AppUi.assets.splash),
      ),
          ),
    );
  }
}
