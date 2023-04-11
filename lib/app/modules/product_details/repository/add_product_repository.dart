import '../../../general/api/base_client.dart';
import '../../../general/utils/urls.dart';

class AddProductRepository {

  static addProduct ({payload})async{
    try{

      var response = BaseClient.post(url: Urls.addProductUrl, payload: payload);
      
      return response;
    }catch(error){
      print(error);
    }
  }
}