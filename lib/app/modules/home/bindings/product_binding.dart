import 'package:get/get.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductController());
  }

}