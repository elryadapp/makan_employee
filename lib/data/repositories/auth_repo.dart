import 'package:makan_employee/core/network/remote/dio_helper.dart';
import 'package:makan_employee/core/network/remote/end_points.dart';
import 'package:makan_employee/core/utils/constants.dart';

class AuthRepo{
  //=================login=================
    static Future<Map<String, dynamic>> authLogin({required Map<String,dynamic>data}) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.login,
      data:  data
    );
    return res.data;
  }
  //=================logout===============
       static Future<Map<String, dynamic>> logout(
    ) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.logout,
      token:'Bearer ${Constants.token}'
    );
    return res.data;
  }
  //=================scan=============================
       static Future<Map<String, dynamic>> scanTicket(
        {
          id,
          query
        }
    ) async {
    var res = await DioHelper.postData(
      url: '${ApiEndPoints.scan}/$id',
       query: query,
            token:'Bearer ${Constants.token}'
    );
    return res.data;
  }
  //=================get permission====================
       static Future<Map<String, dynamic>> getPermissions(
    ) async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.permissions,
      token:'Bearer ${Constants.token}'
    );
    return res.data;
  }
      //===========================get games=======================
   static Future<Map<String, dynamic>> getAllGames(
      {page}
    ) async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.getGames,
    );
    return res.data;
  }
}