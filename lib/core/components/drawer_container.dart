import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/components/drawer_item.dart';
import 'package:makan_employee/core/components/radio_button_row.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/core/utils/constants.dart';
import 'package:makan_employee/core/utils/icon_broken.dart';
import 'package:makan_employee/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';

class DrawerContainer extends StatefulWidget {
  const DrawerContainer({Key? key}) : super(key: key);

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  void initState() {
    CacheHelper.getData(key: 'user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppUi.colors.bgColor,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 5.w, top: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 3.h,
                  backgroundColor: AppUi.colors.whiteColor,
                  child: Image.asset(
                    AppUi.assets.profileIcon,
                    height: 2.5.h,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      Constants.user?.name ?? '',
                      height: 2,
                      fontSize: 2.2.sp,
                    ),
                    AppText(
                      Constants.user?.phoneNumber ?? '',
                      fontSize: 2.sp,
                      color: AppUi.colors.lightGreyColor,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
               Container(
                decoration: BoxDecoration(
                  color: AppUi.colors.bgColor,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    
                    tilePadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        Icon(
                          Icons.public_outlined,
                          color: AppUi.colors.brownColor,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        AppText(LocaleKeys.change_lang.tr(), fontSize: 2.sp),
                      ],
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioButtonRow(
                            title: 'عربى',
                            selectedColor: Constants.lang == 'ar'
                                ? AppUi.colors.brownColor
                                : AppUi.colors.brownGreyColor.withOpacity(.4),
                            ontap: () {
                              MakanCubit.get(context).changeIsDrawerOpened(
                                  MakanCubit.get(context)
                                      .zoomDrawerController
                                      .isOpen!(),
                                  context);
                              context.setLocale(const Locale('ar'));
                              CacheHelper.assignData(key: 'lang', value: 'ar');
                              Constants.lang = 'ar';
                              MakanCubit.get(context).onUpdateData('ar');
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.mainServices, (route) => false);
                            },
                          ),
                          RadioButtonRow(
                            title: 'English',
                            selectedColor: Constants.lang == 'en'
                                ? AppUi.colors.brownColor
                                : AppUi.colors.brownGreyColor.withOpacity(.4),
                            ontap: () {
                              context.setLocale(const Locale('en'));
                              Constants.lang = 'en';
                              MakanCubit.get(context).changeIsDrawerOpened(
                                  MakanCubit.get(context)
                                      .zoomDrawerController
                                      .isOpen!(),
                                  context);
                              CacheHelper.assignData(key: 'lang', value: 'en');
                              MakanCubit.get(context).onUpdateData('en');
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.mainServices, (route) => false);
                            },
                          ),
                          SizedBox(
                            height: 1.2.h,
                          )
                        ],
                      )
                    ],
                  ),
                )),
               
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
               switch(state.logoutStatus){
                case LogoutStatus.loading:
                return AppUtil.appLoader(isSmall: true);
                case LogoutStatus.success:
                 return DrawerItem(
                    onTap: () async {
                      AuthCubit.get(context).logout(context).then((value) =>
                          MakanCubit.get(context).changeIsDrawerOpened(
                              MakanCubit.get(context)
                                  .zoomDrawerController
                                  .isOpen!(),
                              context));
                    },
                    title: LocaleKeys.logout.tr(),
                    icon: IconBroken.Logout);
                    default:
                     return DrawerItem(
                    onTap: () async {
                      AuthCubit.get(context).logout(context).then((value) =>
                          MakanCubit.get(context).changeIsDrawerOpened(
                              MakanCubit.get(context)
                                  .zoomDrawerController
                                  .isOpen!(),
                              context));
                    },
                    title: LocaleKeys.logout.tr(),
                    icon: IconBroken.Logout);
               }
              },
            ),
          ],
        ),
      ),
    );
  }
}
