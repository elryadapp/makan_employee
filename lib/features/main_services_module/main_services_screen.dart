import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/components/error_component.dart';
import 'package:makan_employee/core/components/makan_drawer.dart';
import 'package:makan_employee/core/components/makan_footer.dart';
import 'package:makan_employee/core/makan_cubit/makan_cubit.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/features/main_services_module/main_services_cubit/main_services_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MainServicesScreen extends StatefulWidget {
  const MainServicesScreen({Key? key}) : super(key: key);

  @override
  State<MainServicesScreen> createState() => _MainServicesScreenState();
}

class _MainServicesScreenState extends State<MainServicesScreen> {
  @override
  void initState() {
    MainServicesCubit.get(context).getPermissions(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:
          Container(color: AppUi.colors.bgColor, child: const MakanFooter(
            isSFooter: true,
          )),
      appBar: AppBar(
        leading: BlocBuilder<MakanCubit, MakanState>(
          builder: (context, state) {
            var cubit = MakanCubit.get(context);
            return InkWell(
                onTap: () {
                  cubit.changeIsDrawerOpened(
                      cubit.zoomDrawerController.isOpen!(), context);
                },
                child: !cubit.isDrawerOpened
                    ? const Icon(Icons.clear)
                    : const Icon(Icons.short_text));
          },
        ),
      ),
      body: BlocBuilder<MainServicesCubit, MainServicesState>(
        builder: (context, state) {
          var cubit = MainServicesCubit.get(context);
          switch (state.getPermissionsStates) {
            case GetPermissionsStates.loading:
              return Center(child: AppUtil.appLoader());
            case GetPermissionsStates.loaded:
              return MakanDrawer(
                mainScreen: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.5.h,
                            ),
                            AppText(
                              LocaleKeys.Makan_Entertainment_Camp.tr(),
                              color: AppUi.colors.darkGreyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 2.3.sp,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: AppText(
                                LocaleKeys.In_camp_services.tr(),
                                color: AppUi.colors.darkGreyColor,
                                fontSize: 2.2.sp,
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            )
                          ],
                        ),
                      ),
                      SliverGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 1.h,
                        childAspectRatio: 1.3,
                        children: List.generate(
                            cubit.permissionsList.length,
                            (index) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        cubit.permissionsList[index].route!,
                                        arguments: [ cubit.permissionsList[index].image, cubit.permissionsList[index].name]
                                        );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppUi.colors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color: AppUi.colors.lightBrownColor
                                                .withOpacity(.2))
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(cubit
                                            .permissionsList[index].image!),
                                        AppText(
                                          cubit.permissionsList[index].name!,
                                          fontSize: 2.3.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              );
            case GetPermissionsStates.failure:
              return ErrorComponent(
                  exception: state.exception,
                  onTap: () {
                    MainServicesCubit.get(context).getPermissions(context);
                  });
            default:
              return Center(child: AppUtil.appLoader());
          }
        },
      ),
    );
  }
}
