import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class ErrorComponent extends StatelessWidget {
  final String? exception;
  final Function() onTap;
  const ErrorComponent({Key? key, this.exception, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppUi.assets.error, height: 20.h),
                    AppText(
                      exception ?? LocaleKeys.error_Not_Implemented.tr(),
                      height: 2,
                      fontSize: 2.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: AppText(
                       LocaleKeys.try_again.tr(),
                       textDecoration:TextDecoration.underline,
                      decorationColor: AppUi.colors.failureRed,
                       color: AppUi.colors.failureRed,
                        height: 2,
                        fontSize: 2.2.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
              );
  }
}