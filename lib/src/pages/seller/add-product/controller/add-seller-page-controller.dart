import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../infrastructure/commons/user-type.dart';
import '../models/seller-add-product-dto.dart';
import '../repository/add-repository.dart';


class AddSellerPageController extends GetxController {
  final  SellerAddRepository _sellerAddRepository = SellerAddRepository();
  final TextEditingController tittleTextController = TextEditingController(),
      descriptionTextController = TextEditingController(),
      priceTextController = TextEditingController(),
      countTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  Rx<String> imageToString = "".obs;
  Rx<Color> pickedColor = const Color(0xff04927c).obs;
  RxList<String> colors = RxList();
  RxBool isLoadingButton = false.obs;

  Future<void> addPicture() async {
    final picker = ImagePicker();
    final imagePicked = await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      List<int> byte = await imagePicked.readAsBytes();
      imageToString.value = base64Encode(byte);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          backgroundColor: Colors.red,
          message: 'image is not select',
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void removePicture() {
    imageToString.value = '';
  }

  void updateColor(Color color) {
    pickedColor.value = color;
  }

  void removeColor(int index) {
    colors.removeAt(index);
  }

  String? textFormsFieldValidator(value) {
    return value == null || value.isEmpty ? 'required' : null;
  }

  Future<void> submitButton() async {
    isLoadingButton.value = true;
    final result =
    await _sellerAddRepository.getProductByTittle(tittle: tittleTextController.text);
    isLoadingButton.value = false;
    result.fold(
          (left) {
        Get.showSnackbar(

          GetSnackBar(
            backgroundColor: Colors.red,
            message: '${'error'} : $left',
            duration: const Duration(seconds: 2),
          ),
        );
      },
          (right) async {
        if (right.isEmpty) {
          isLoadingButton.value = true;
          final result = await _sellerAddRepository.postProduct(

            dto: SellerAddProductDto(
              descriptionTextController.text,
              imageToString.value,
              colors,
              tittle: tittleTextController.text,
              count: int.parse(countTextController.text.trim()),
              price: int.parse(priceTextController.text.trim()),
              sellerId: UserType.userId,
            ),
          );
          isLoadingButton.value = false;
          result.fold(
                (left) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: Colors.red,
                message: '${'error'} : $left',
                duration: const Duration(seconds: 2),
              ));
            },
                (right) => Get.back(result: right),
          );
        } else {
          Get.showSnackbar(
            const GetSnackBar(
              backgroundColor: Colors.greenAccent,
              message: 'Exit',
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }

  void colorPicker() {
    colors.add(pickedColor.value.toString().split('(0x')[1].split(')')[0]);
  }
}
