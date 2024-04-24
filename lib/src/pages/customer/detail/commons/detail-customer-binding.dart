import 'package:get/get.dart';
import '../controller/detail-customer-controller.dart';

class DetailCustomerBinding extends Bindings {
  @override
  void dependencies() {
    final String productId = Get.parameters['productId']!;
    Get.lazyPut(() => DetailCustomerPageController(productId: productId));
  }

}