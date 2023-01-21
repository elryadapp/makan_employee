import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class PriceCard extends StatelessWidget {
  final String price;
  const PriceCard({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                  padding:
                      EdgeInsets.symmetric(vertical: .8.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppUi.colors.lightBrownColor.withOpacity(.3)),
                  child: AppText(
                    '$price ${LocaleKeys.S_R.tr()}',
                    fontSize: 2.sp,
                    color: AppUi.colors.darkGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                );
  }
}