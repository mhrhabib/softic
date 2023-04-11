import 'package:softic/app/general/api/base_client.dart';
import 'package:softic/app/general/utils/urls.dart';
import 'package:softic/app/modules/profile/models/profile.dart';
import 'package:dio/dio.dart' as dio;

class ProfileRepo {


  Future<Profile> getProfileData()async{
    try{
      dio.Response response = await BaseClient.get(url: Urls.profileUrl);
      if(response.statusCode == 200){
        print(response.data);
        Profile profile =  Profile.fromJson(response.data);

        return profile;
      }else{
        throw "profile data load error";
      }
    }catch(error){
      rethrow;
    }
  }
}