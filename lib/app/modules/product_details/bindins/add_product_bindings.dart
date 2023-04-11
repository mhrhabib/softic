import 'package:get/get.dart';
import 'package:softic/app/modules/product_details/controllers/add_product_controller.dart';

class AddProductBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }

}