import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:softic/app/modules/home/models/product.dart';
import 'package:softic/app/modules/home/repository/product_repo.dart';

class ProductController extends GetxController {
  Box? box;
  List products = [].obs;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('productList');
    return;
    
  }

  Future putData(data) async {
    await box!.clear();

    for (var d in data) {
      box!.add(d);
    }
    update();
  }

  void getProductList() async {
    await openBox();
    try {
      var response = await ProductRepo().getAllProduct();

      await putData(response);
    } catch (SocketException) {
      print("No internet");
    }

    //get the data from DB

    var myMap = box!.toMap().values.toList();
    print(">>>>>>>> $myMap");
    if (myMap.isEmpty) {
      products.add("empty");
    } else {
      products.addAll(myMap);
    }
    print(products.length);
    update();
  }

  Future<void> updateList() async {
    try {
      var response = await ProductRepo().getAllProduct();

      await putData(response);
    } catch (SocketException) {
      print("No internet");
    }
  }

  void deleteProduct(int id) async {
    await ProductRepo().deleteProduct(id);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductList();
  }
}
