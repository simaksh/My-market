import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../infrastructure/commons/user-type.dart';
import '../../../infrastructure/route/route-name.dart';
import '../models/login-view-model.dart';
import '../repository/login-repository.dart';


class LoginPageController extends GetxController {
  final LoginRepository _repository = LoginRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController userNameTextController = TextEditingController(),
      passwordTextController = TextEditingController();
  final SharedPreferences _preferences = Get.find<SharedPreferences>();
  RxBool isPasswordShow = true.obs;
  RxBool isLoadingButton = false.obs;
  RxBool isRemember = false.obs;

  void showPass() {
    isPasswordShow.value = !isPasswordShow.value;
  }

  void rememberCheck(newValue) {
    isRemember.value = newValue;
  }

  Future<void> signUp() async {
    userNameTextController.clear();
    passwordTextController.clear();
    final result =
    await Get.toNamed(RouteName.login + RouteName.signup);
    if (result != null) {
      userNameTextController.text = result['userName'];
      passwordTextController.text = result['password'];
    }
  }

  void changeLanguage({required Locale locale}) => Get.updateLocale(locale);

  String? usernameAndPassWordFieldValidator(value) {
    return value == null || value.isEmpty
        ? 'is required'
        : null;
  }


  Future<void> login() async {
    isLoadingButton.value = true;
    final result = await _repository.getUsers(
        userName: userNameTextController.text);
    isLoadingButton.value = false;
    result.fold(
          (left) {
        return Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.red,
            message: '${'error'} : $left',
            duration: const Duration(seconds: 2),
          ),
        );
      },
          (right) async {
        if (right.isEmpty) {
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor:Colors.orange ,
              message: 'UserName And Password is Required',
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          LoginViewModel user = LoginViewModel.fromJson(right[0]);
          if (user.password == passwordTextController.text.trim()) {
            UserType.isAdmin = user.isAdmin;
            UserType.userId = user.id;
            if (isRemember.value) {
              await _preferences.setString('id', user.id);
              await _preferences.setBool('isAdmin', user.isAdmin);
            }
            if (user.isAdmin) {
              Get.offNamed(
                RouteName.seller,
              );
            } else {
              Get.offNamed(RouteName.customer);
            }
          } else {
            Get.showSnackbar(
              const GetSnackBar(
                backgroundColor: Colors.red,
                message: 'incorrect',
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      },
    );
  }
}
