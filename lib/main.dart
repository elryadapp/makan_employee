import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/core/network/remote/dio_helper.dart';
import 'package:makan_employee/core/utils/constants.dart';
import 'package:makan_employee/generated/codegen_loader.g.dart';
import 'package:makan_employee/makan_root/makan_root.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();
    await DioHelper.init();
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      startLocale:  Locale(Constants.lang),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const MakanApp()));
}

