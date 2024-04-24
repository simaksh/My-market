import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/signup-dto.dart';
import '../repository/signup-repository.dart';

class SignupPageController extends GetxController {
  final SignupRepository _repository = SignupRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController firstNameTextController = TextEditingController(),
      lastNameTextController = TextEditingController(),
      userNameTextController = TextEditingController(),
      passwordTextController = TextEditingController(),
      repeatPasswordTextController = TextEditingController();
  RxBool isAdmin = false.obs;
  RxBool isLoadingButton = false.obs;

  void radioButton(newValue) {
    isAdmin.value = newValue;
  }

  String?  textFormsFieldValidator(value) {
    return value == null || value.isEmpty
        ? 'required'
        : null;
  }
  String? repeatPasswordFieldValidator(value) {
    return value == null || value.isEmpty
        ? 'required'
        : value != passwordTextController.text
        ?'wrong'
        : null;
  }


  String? passwordFieldValidator(value) {
    return value == null || value.trim().isEmpty
        ? 'required'
        : value.trim().length < 3
        ? 'wrong'
        : null;
  }


  Future<void> signUp() async {
    isLoadingButton.value = true;
    final result = await _repository.getUserByUserName(
        userName: userNameTextController.text);
    isLoadingButton.value = false;
    result.fold((left) {
      return Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          message: '${'error'} : $left',
          duration: const Duration(seconds: 2),
        ),
      );
    }, (right) async {
      if (right.isEmpty) {
        isLoadingButton.value = true;
        final result = await _repository.postUser(
          dto: SignupDto(
            firstName: firstNameTextController.text,
            lastName: lastNameTextController.text,
            userName: userNameTextController.text,
            password: passwordTextController.text,
            isAdmin: isAdmin.value,
          ),
        );
        isLoadingButton.value = false;
        result.fold(
                (left) => Get.showSnackbar(
              GetSnackBar(
                backgroundColor: Colors.red,
                message: '${'error'} : $left',
                duration: const Duration(seconds: 2),
              ),
            ), (right) {
          Get.back(result: {
            'userName': right['userName'],
            'password': right['password']
          });
        });
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            backgroundColor: Colors.lightGreen,
            message:'Users Exit',
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }
}
