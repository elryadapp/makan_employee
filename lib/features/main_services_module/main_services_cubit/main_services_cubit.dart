import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/errors/expations.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/core/utils/app_ui.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/core/utils/constants.dart';
import 'package:makan_employee/data/models/permissions_model.dart';
import 'package:makan_employee/data/repositories/auth_repo.dart';
import 'package:makan_employee/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
part 'main_services_state.dart';

class Category {
  final String? name;
  final String? image;
  final String? route;
  Category({this.name, this.image, this.route});
}

class MainServicesCubit extends Cubit<MainServicesState> {
  MainServicesCubit() : super(MainServicesState());
  static MainServicesCubit get(context) => BlocProvider.of(context);
  List<Category> permissionsList = [];
  //=====================get All Categories=======================
  Future<void> getPermissions(context) async {
    emit(state.copyWith(getPermissionsStates: GetPermissionsStates.loading));

    try {
      permissionsList = [];
      Constants.lang = await CacheHelper.getData(key: 'lang');

      final permissionModel = await AuthRepo.getPermissions();

      if (permissionModel['success'] == false) {
        AppUtil.appAlert(context,
            msg: permissionModel['message'][0],
            contentType: ContentType.failure);
        emit(
          state.copyWith(
            getPermissionsStates: GetPermissionsStates.failure,
          ),
        );
      } else {
        emit(state.copyWith(
            getPermissionsStates: GetPermissionsStates.loaded,
            permessionsModel: PermessionsModel.fromJson(permissionModel)));
        if (state.permessionsModel!.permissionData!.tickets!) {
          permissionsList.add(Category(
              route: Routes.startScan,
              name: LocaleKeys.Entrance_tickets.tr(),
              image: AppUi.assets.tickets));
        }
        if (state.permessionsModel!.permissionData!.games!) {
          permissionsList.add(Category(
              route: Routes.gameCategorySelection,
              name: LocaleKeys.games.tr(),
              image: AppUi.assets.games));
        }
        if (state.permessionsModel!.permissionData!.camps!) {
          permissionsList.add(Category(
              route: Routes.startScan,
              name: LocaleKeys.Outdoor_Seating.tr(),
              image: AppUi.assets.externalIcon));
        }
        if (state.permessionsModel!.permissionData!.sessions!) {
          permissionsList.add(Category(
              route: Routes.startScan,
              name: LocaleKeys.privatemeetings.tr(),
              image: AppUi.assets.reservation));
        }
      }
    } catch (exception) {
      debugPrint("exception-----------------------------$exception");
      emit(
        state.copyWith(
          getPermissionsStates: GetPermissionsStates.failure,
          exception: getExptionMessageMessage(exception),
        ),
      );
    }
  }
}
