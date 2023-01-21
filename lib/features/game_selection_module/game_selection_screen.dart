import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/components/app_text.dart';
import 'package:makan_employee/core/components/error_component.dart';
import 'package:makan_employee/core/components/makan_footer.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/features/game_selection_module/games_cubit/games_cubit.dart';
import 'package:makan_employee/features/scanning_module/makan_scanning_cubit/makan_scanning_cubit.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class GameSelectionScreen extends StatefulWidget {
  const GameSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectionScreen> createState() => _GameSelectionScreenState();
}

class _GameSelectionScreenState extends State<GameSelectionScreen> {
  @override
  void initState() {
                      GamesCubit.get(context).getGameData(context);

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
        title: AppText(LocaleKeys.choose_game.tr()),
      ),
      body: BlocBuilder<GamesCubit, GamesState>(
        builder: (context, state) {
          switch (state.getGameState) {
            case GetGamesStates.loading:
              return AppUtil.appLoader();
            case GetGamesStates.loaded:
              return Padding(
                padding: EdgeInsets.only(left: 5.w,right: 5.w,top:3.h ,bottom: 8.h),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    itemCount: state.gameModel!.data!.length,
                    itemBuilder: ((context, index) => InkWell(
                          onTap: () {
                            MakanScanningCubit.get(context).type='2';
                            MakanScanningCubit.get(context).gameId =
                                state.gameModel!.data![index].productId;
                            Navigator.pushNamed(context, Routes.startScan,
                                arguments: [
                                  AppUi.assets.games,
                                  LocaleKeys.games.tr(),
                                ]);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppUi.colors.whiteColor,
                                border: Border.all(
                                    color: AppUi.colors.brownGreyColor
                                        .withOpacity(.2))),
                            child: Center(
                                child: AppText(
                              state.gameModel!.data![index].name!,
                              fontSize: 2.5.sp,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ))),
              );
            case GetGamesStates.failure:
              return ErrorComponent(
                onTap: () {
                  GamesCubit.get(context).getGameData(context);
                },
                exception: state.exception,
              );
            default:
              return AppUtil.appLoader();
          }
        },
      ),
    );
  }
}
