import 'package:flutter/material.dart';



extension Sizer on num {
     double get h => this * 926 / 100;

     double get w => this * 428/ 100;

    double get sp =>(((926+428)/2)*this)/100;
  
}



class AppUi {
  static _AppColors get colors => _AppColors();
  static _AppAssets get assets => _AppAssets();
}

class _AppColors {
  
  final darkGreyColor = const Color(0xff3C3C3C);
  final brownGreyColor=const Color(0xff7A6A58);
  final lightGreyColor = const Color(0xff707070);
  final failureRed =const Color.fromARGB(255, 158, 9, 29);
  final successGreen = const Color(0xff85BC87);
  final brownColor = const Color(0xff964731);
  final lightBrownColor = const Color(0xffF8B17F);
  final totalCardColor=const Color(0xffFFF9F0);
  final vLightGreyColor = const Color(0xffEAE8DB);
  final offWhitColor = const Color(0xffF8F7F1);
    final whiteColor = const Color(0xffFFFFFF);
final bgColor=const Color(0xffEAE8DB);
  final firstGradientColor = const Color(0xffD8E7E2);
   final shimmerBaseColor = Colors.grey.withOpacity(.2);
  final shimmerHighLightColor = Colors.grey.withOpacity(.7);
  final secondGradlentColor = const Color(0xffC9DBD4);
  final firstCompoColor = const Color(0xffF7F5EC);
  final secondCompoColor=const Color(0xffEAE8DB);

}
String image='assets/images/';
String icons='assets/icons/';
String lottie='assets/lottie/';
class _AppAssets {
  final splash='${icons}splash.png';
  final errorIcon='${icons}error_icon.png';
  final successIcon='${icons}success_icon.png';
  final externalIcon='${icons}external_icon.png';
    final externalIconW='${icons}external_icon_w.png';
    final error='${lottie}error.json';

  final arIcon='${icons}ar_icon.png';
  final enIcon='${icons}en_icon.png';
  final footer='${image}footer.png';
    final sFooter='${image}s_footer.png';

  final logo='${image}logo.svg';
  final loading='${lottie}loading.json';
    final emptyNotif='${lottie}empty_notifications.json';
    final emptyCart='${lottie}empty_cart.json';
  final profileIcon='${icons}profile_icon.png';
  final food='${icons}food.png';
  final games='${icons}games.png';
  final reservation='${icons}reservation.png';
  final tickets='${icons}ticket_icon.png';
}
