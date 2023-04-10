import 'package:get/get.dart';
import 'package:softic/app/modules/auth/sign_in/controllers/auth_controller.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthContoller());
  }

}