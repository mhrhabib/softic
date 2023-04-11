import 'package:get/get.dart';
import 'package:softic/app/modules/profile/controller/profile_controller.dart';

class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => ProfileController());
  }

}