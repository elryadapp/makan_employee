import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';
import 'package:makan_employee/features/scanning_module/scan_success.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ScanResultScreen extends StatelessWidget {
  final dynamic dataModel;
  const ScanResultScreen({Key? key, this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakanScanningCubit, MakanScanningState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppUi.colors.whiteColor,
          appBar: AppBar(
            leading: Container(),
            backgroundColor:  AppUi.colors.whiteColor,
          ),
          body: MakanScanningCubit.get(context).ScanDataModel == null
              ? Center(child: AppUtil.appLoader())
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          MakanScanningCubit.get(context).ScanDataModel.success
                              ? 5.h
                              : 10.h),
                  child: Center(
                    child: Column(
                      children: [
                        MakanScanningCubit.get(context).ScanDataModel.success
                            ? CircleAvatar(
                                radius: 8.h,
                                backgroundColor: AppUi.colors.successGreen,
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: AppUi.colors.whiteColor,
                                  size: 8.h,
                                ),
                              )
                            : Lottie.asset(AppUi.assets.error, height: 25.h),
                        AppText(
                          MakanScanningCubit.get(context).ScanDataModel.success
                              ? LocaleKeys.the_reservation_is_confirmed.tr()
                              : MakanScanningCubit.get(context)
                                  .ScanDataModel
                                  .message[0],
                          fontWeight: FontWeight.bold,
                          height: 4,
                          fontSize: 2.5.sp,
                        ),
                        if (MakanScanningCubit.get(context)
                            .ScanDataModel
                            .success)
                          ScanSuccess(dataModel: dataModel)
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
