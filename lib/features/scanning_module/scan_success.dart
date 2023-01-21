import 'package:flutter/material.dart';
import 'package:makan_employee/core/components/app_divider.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/icon_broken.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';
import 'package:makan_employee/features/scanning_module/my_ticket_data_column.dart';
import 'package:makan_employee/features/scanning_module/ticket_details.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';


class ScanSuccess extends StatefulWidget {
  final dynamic dataModel;

  const ScanSuccess({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  State<ScanSuccess> createState() => _ScanSuccessState();
}

class _ScanSuccessState extends State<ScanSuccess> {

 

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        padding:
            EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.5.h),
        decoration: BoxDecoration(
          color: AppUi.colors.bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  MakanScanningCubit.get(context).type == '1'
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(LocaleKeys.reservation_details.tr(),
                      fontSize: 2.2.sp, fontWeight: FontWeight.w600),
                  MakanDivider(
                    color:
                        AppUi.colors.lightGreyColor.withOpacity(.5),
                  ),
                  TicketDetails(
                    dataModel: widget.dataModel,
                  ),
                ],
              )
            :  MakanScanningCubit.get(context).type == '3'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(LocaleKeys.reservation_details.tr(),
                          fontSize: 2.2.sp,
                          fontWeight: FontWeight.w600),
                      MakanDivider(
                        color: AppUi.colors.lightGreyColor
                            .withOpacity(.5),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      MyTicktDataRow(
                        icon: IconBroken.Document,
                        des:
                            '${LocaleKeys.description.tr()} : ${widget.dataModel.data!.name!}',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: MyTicktDataRow(
                          icon: IconBroken.Time_Square,
                          des:
                              '${LocaleKeys.reservation_type.tr()} : ${widget.dataModel.data!.type == 0 ? LocaleKeys.by_hour.tr() : LocaleKeys.by_day.tr()}',
                        ),
                      ),
                      if (widget.dataModel.data!.type == 0)
                        MyTicktDataRow(
                            icon: Icons.timer_outlined,
                            des:
                                '${LocaleKeys.hour_count.tr()} : ${widget.dataModel.data!.hours}')
                    ],
                  )
                :  MakanScanningCubit.get(context).type == '4'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(LocaleKeys.reservation_details.tr(),
                              fontSize: 2.2.sp,
                              fontWeight: FontWeight.w600),
                          MakanDivider(
                            color: AppUi.colors.lightGreyColor
                                .withOpacity(.5),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          MyTicktDataRow(
                            icon: IconBroken.Document,
                            des:
                                '${LocaleKeys.description.tr()} : ${widget.dataModel.data?.name ?? ''}',
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 1.h),
                            child: MyTicktDataRow(
                              icon: IconBroken.Time_Square,
                              des:
                                  '${LocaleKeys.reservation_date.tr()} : ${widget.dataModel.data?.date ?? ''}',
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(LocaleKeys.reservation_details.tr(),
                              fontSize: 2.2.sp,
                              fontWeight: FontWeight.w600),
                          MakanDivider(
                            color: AppUi.colors.lightGreyColor
                                .withOpacity(.5),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Card(
                                      color: AppUi.colors.bgColor,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(6.0),
                                        child: AppText(
                                          widget.dataModel.data!.name!,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 2.3.sp,
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h),
                                    child: MyTicktDataRow(
                                      icon: IconBroken.Time_Square,
                                      des:
                                          '${LocaleKeys.reservation_amount.tr()} : ${widget.dataModel.data!.quantity}',
                                    ),
                                  ),
                                  MyTicktDataRow(
                                      icon: Icons.timer_outlined,
                                      des:
                                          '${LocaleKeys.remaining_amount.tr()} : ${widget.dataModel.data!.leftQuantity}'),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                ],
                              )
                        ],
                      ));
  }
}
