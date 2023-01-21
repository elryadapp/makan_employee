import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static clearCache({required String key, context}) {
    sharedPreferences.remove(key);
    
  }


  static Future<bool> assignData({
    required String key,
    required dynamic value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static  getData({required String key}) {
    return sharedPreferences.get(key);
  }

 
}