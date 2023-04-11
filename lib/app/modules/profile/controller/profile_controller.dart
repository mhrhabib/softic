import 'package:get/state_manager.dart';
import 'package:softic/app/modules/profile/models/profile.dart';
import 'package:softic/app/modules/profile/repository/profile_repo.dart';

class ProfileController extends GetxController with StateMixin<Profile>{


  final ProfileRepo _profileRepo = ProfileRepo();

  void getProfileData()async{
    RxStatus.loading();
    await _profileRepo.getProfileData().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((onError){
      change(onError, status: RxStatus.error());
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }
}