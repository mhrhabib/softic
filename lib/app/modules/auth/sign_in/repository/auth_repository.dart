import 'package:softic/app/general/api/base_client.dart';
import 'package:softic/app/general/utils/urls.dart';

class AuthRepository {

  static login ({payload})async{
    try{

      var response = BaseClient.post(url: Urls.authUrl, payload: payload);
      
      return response;
    }catch(error){
      print(error);
    }
  }
}