import'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/config/app_routes/route_generator.dart';
import 'package:makan_employee/config/app_themes/app_theme.dart';
import 'package:makan_employee/core/validators/bloc_providers.dart';

class MakanApp extends StatelessWidget {
  const MakanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:BlocProviders.providers(context),
      child: MaterialApp(
                title: 'Makan_employee',
              localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: AppThemes.lightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splash,
                
                onGenerateRoute: RouterGenerator.generateRoute,
              
            ),
    );
  }
}