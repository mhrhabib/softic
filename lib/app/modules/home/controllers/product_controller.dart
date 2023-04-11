import 'package:get/get.dart';
import 'package:softic/app/modules/home/models/product.dart';
import 'package:softic/app/modules/home/repository/product_repo.dart';

class ProductController extends GetxController{
   List<Product> _porductList = <Product>[].obs;

  List<Product> get productList => _porductList;



  void getProductList()async{
      var response = await ProductRepo().getAllProduct();
      _porductList.addAll(response);
      update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductList();
  }
}