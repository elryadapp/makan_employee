import 'package:flutter/material.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/animated_commponent.dart';
import 'package:makan_employee/core/components/makan_footer.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/features/welcome_module/component/lang_row.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Column(
          children: [
            MakanSlideAnimation(
                horizontalOffset: 0,
                verticalOffset: -100,
                child: Image.asset(AppUi.assets.splash, height: 22.h)),
            SizedBox(
              height: 15.h,
            ),
            MakanSlideAnimation(
              horizontalOffset: 100,
              verticalOffset: 0,
              child: LangRow(
                title: 'عربى',
                img: AppUi.assets.arIcon,
                onTap: () {
                  context.setLocale(const Locale('ar'));
                  CacheHelper.assignData(key: 'lang', value: 'ar');
                  MakanCubit.get(context).onUpdateData('ar');
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
              ),
            ),
            SizedBox(height: 2.h,),
            MakanSlideAnimation(
              horizontalOffset: -100,
              verticalOffset: 0,
              child: LangRow(
                isBordered: true,
                title: 'English',
                img: AppUi.assets.enIcon,
                onTap: () {
                  context.setLocale(const Locale('en'));
                  CacheHelper.assignData(key: 'lang', value: 'en');
                  MakanCubit.get(context).onUpdateData('en');

                  Navigator.pushReplacementNamed(context, Routes.login);
                },
              ),
            ),
            const Spacer(),
            const MakanFooter(isSFooter: true),
          ],
        ),
      ),
    );
  }
}
