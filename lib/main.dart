import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_market/src/infrastructure/commons/user-type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';


Future<void> main() async{
  final preferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(preferences);
  UserType.isAdmin = preferences.getBool('isAdmin');
  UserType.userId = preferences.getString('id');
  runApp(const App());
}
