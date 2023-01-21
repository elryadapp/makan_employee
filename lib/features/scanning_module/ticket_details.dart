import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:makan_employee/core/components/app_button.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/icon_broken.dart';
import 'package:makan_employee/features/scanning_module/my_ticket_data_column.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
class TicketDetails extends StatelessWidget {
  final dynamic dataModel;
  const TicketDetails({Key? key, this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         MyTicktDataRow(
                          icon: IconBroken.User1,
                          des:LocaleKeys.children_count.tr(),
                        ),
                                                const Spacer(),

                        MakanButton(
                          
                          height: 3.h,
                          width: 15.w,
                          fontSize: 1.6.sp,
                          borderRadius: BorderRadius.circular(5),
                          color: AppUi.colors.whiteColor,
                          border: Border.all(color: AppUi.colors.shimmerBaseColor),
                          titleColor: AppUi.colors.darkGreyColor,
                          title: dataModel.data!
                              .firstWhere(
                                  (element) => element.name == "تذكرة عادية",
                                 )
                              .quantity
                              .toString()+LocaleKeys.individuals_count.tr(),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        children: [
                           MyTicktDataRow(
                            icon: Icons.child_care,
                            des: LocaleKeys.children_count.tr(),
                          ),
                                                  const Spacer(),

                          MakanButton(
                             height: 3.h,
                            width: 15.w,
                                                      borderRadius: BorderRadius.circular(5),

                            fontSize: 1.6.sp,
                            color: AppUi.colors.whiteColor,
                            border: Border.all(color: AppUi.colors.shimmerBaseColor),
                            titleColor: AppUi.colors.darkGreyColor,
                            title: dataModel.data!
                                .firstWhere(
                                    (element) => element.name ==  "تذكرة اطفال",
                                   )
                                .quantity
                                .toString()+LocaleKeys.child.tr(),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                         MyTicktDataRow(
                          icon: IconBroken.Location,
                          des:LocaleKeys.car_paking.tr(),
                        ),
                        const Spacer(),
                        MakanButton(
                           height: 3.h,
                                                     borderRadius: BorderRadius.circular(5),

                          width: 15.w,
                          fontSize: 1.6.sp,
                          color: AppUi.colors.whiteColor,
                          border: Border.all(color: AppUi.colors.shimmerBaseColor),
                          titleColor: AppUi.colors.darkGreyColor,
                          title: dataModel.data!
                              .firstWhere(
                                  (element) => element.name == "موقف مميز",
                                 )
                              .quantity
                              .toString()+LocaleKeys.VIP.tr(),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
  }
}