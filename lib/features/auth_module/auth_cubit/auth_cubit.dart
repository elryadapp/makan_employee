import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/errors/expations.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/core/utils/constants.dart';
import 'package:makan_employee/data/models/user_model.dart';
import 'package:makan_employee/data/repositories/auth_repo.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  static AuthCubit get(context) => BlocProvider.of(context);



  //=============login==============
  Future<bool> authLogin(context,
      {required String password, required String phoneNumber}) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    try {
      final response = await AuthRepo.authLogin(data: {
        "phone_number": phoneNumber,
        "password": password,
      });
      UserModel user = UserModel.fromJson(response);

      if (user.success == false) {
        AppUtil.appAlert(context,
            msg: user.message![0], contentType: ContentType.failure);
        emit(
          state.copyWith(
            loginStatus: LoginStatus.failure,
          ),
        );
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.success,
            userData:user));
                        CacheHelper.assignData(key: 'user', value:json.encode( user.userData!.employee!.toJson()));

        CacheHelper.assignData(key: 'jwt', value: user.userData!.token);
        CacheHelper.assignData(
            key: 'user_name', value: user.userData!.employee!.name);
        Constants.user=user.userData!.employee!;
        Constants.userName = user.userData!.employee!.name!;
        Constants.token = user.userData!.token;
        Navigator.pushReplacementNamed(context, Routes.mainServices);
      }

      return true;
    } catch (exception) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
          exception: getExptionMessageMessage(exception),
        ),
      );
      AppUtil.appAlert(context,
          msg: state.exception, contentType: ContentType.failure);
      return false;
    }
  }


//===================logout===============
 Future<void> logout(context) async {
    emit(state.copyWith(logoutStatus: LogoutStatus.loading));

    try {
      var response = await AuthRepo.logout();
      emit(state.copyWith(
          logoutStatus: LogoutStatus.success,
      ));
     await CacheHelper.clearCache(key: 'jwt');
     await CacheHelper.clearCache(key: 'user_name');
     await CacheHelper.clearCache(key: 'user');
     Constants.user=null;
     Constants.token=null;
     Constants.userName='';
     Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
    } catch (exception) {
      debugPrint("exception-----------------------------$exception");
      emit(
        state.copyWith(
          logoutStatus: LogoutStatus.failure,
          exception: getExptionMessageMessage(exception),
        ),
      );
    }
  }
  
}
