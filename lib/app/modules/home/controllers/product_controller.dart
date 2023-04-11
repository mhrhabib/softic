import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softic/app/modules/home/models/product.dart';
import 'package:softic/app/modules/home/repository/product_repo.dart';

class ProductController extends GetxController with StateMixin<List<Product>>{
  



  void getProductList()async{
      RxStatus.loading();
       await ProductRepo().getAllProduct().then((value) {
        change(value, status: RxStatus.success());
       }).catchError((onError){
        change(onError, status: RxStatus.error());
       });
      
      
  }


  void deleteProduct (int id)async{
    var response = await ProductRepo().deleteProduct(id);
    getProductList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductList();
  }


}