import 'package:flutter/material.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/app_button.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/components/makan_footer.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class StartScanScreen extends StatelessWidget {
  final dynamic scanData;

  const StartScanScreen({Key? key, this.scanData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:
          Container(color: AppUi.colors.bgColor, child: const MakanFooter()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(scanData[0]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: AppText(
              '${LocaleKeys.scan.tr()} ${scanData[1]}',
              fontSize: 2.5.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: MakanButton(
              onTap: () {
                MakanScanningCubit.get(context).type =
                    scanData[1] == LocaleKeys.games.tr()
                        ? '2'
                        : scanData[1] == LocaleKeys.Entrance_tickets.tr()
                            ? '1'
                            :scanData[1] == LocaleKeys.Outdoor_Seating.tr()?'4':"3";
                Navigator.pushNamed(context, Routes.scan);
              },
              titleWidget: AppText(
                LocaleKeys.scan_qrcode.tr(),
                color: AppUi.colors.whiteColor,
                fontSize: 2.2.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
