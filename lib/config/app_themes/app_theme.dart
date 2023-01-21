import 'package:flutter/material.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

class AppThemes {
 static Map<int, Color> color = {
    50: const Color (0xffEAE8DB,),
    100: const Color(0xffEAE8DB),
    200: const Color(0xffEAE8DB),
    300: const Color(0xffEAE8DB),
    400: const Color(0xffEAE8DB),
    500: const Color(0xffEAE8DB),
    600: const Color(0xffEAE8DB),
    700: const Color(0xffEAE8DB),
    800: const Color(0xffEAE8DB),
    900: const Color(0xffEAE8DB),
  };

 static ThemeData get lightTheme => ThemeData(
  scaffoldBackgroundColor: AppUi.colors.bgColor,
        primarySwatch: MaterialColor(0xffEAE8DB, color),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          selectedItemColor: AppUi.colors.brownColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
            titleSpacing: 20,
            
            centerTitle: true,
            
            iconTheme: IconThemeData(color:  AppUi.colors.darkGreyColor),
            titleTextStyle: TextStyle(
              color: AppUi.colors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            // systemOverlayStyle: SystemUiOverlayStyle(
            //     statusBarColor: AppUi.colors.mainColor,
            //     statusBarBrightness: Brightness.dark,
            //     statusBarIconBrightness: Brightness.dark),
            // backgroundColor: AppUi.colors.mainColor,
            // elevation: 0,
            // iconTheme: IconThemeData(color: AppUi.colors.whiteColor)),
     
   ) );

     
}