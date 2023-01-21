import 'package:flutter/services.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:scan/scan.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  String platformVersion = 'Unknown';
  ScanController controller = ScanController();
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      platformVersion = platformVersion;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakanCubit, MakanState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            ScanView(
              controller: controller,
              scanAreaScale: .7,
              scanLineColor: AppUi.colors.brownGreyColor,
              onCapture: (data) {
                MakanScanningCubit.get(context).scanningQrCode(
                  context: context,
                  id: data,
                );
               
              },
            ),
            Positioned(
              top: 13.h,
              child: AppText(
                LocaleKeys.scan_code.tr(),
                fontWeight: FontWeight.w600,
                fontSize: 2.2.sp,
                color: AppUi.colors.whiteColor.withOpacity(.8),
              ),
            )
          ],
        );
      },
    );
  }
}
