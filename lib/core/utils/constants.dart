import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:makan_employee/core/network/local/cache_helper.dart';
import 'package:makan_employee/data/models/user_model.dart';

class Constants {
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getwidth(context) => MediaQuery.of(context).size.width;
  static String lang=CacheHelper.getData(key: 'lang')?? 'ar';
    static String? token=CacheHelper.getData(key: 'jwt');
    static String userName=CacheHelper.getData(key: 'user_name')??'';
    static Employee? user=Employee.fromJson(json.decode(CacheHelper.getData(key: 'user')));
}
