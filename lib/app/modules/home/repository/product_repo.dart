import 'dart:convert';

import 'package:softic/app/general/api/base_client.dart';
import 'package:softic/app/general/utils/urls.dart';
import 'package:softic/app/modules/home/models/product.dart';
import 'package:dio/dio.dart' as dio;

class ProductRepo {
  Future<List<Product>> getAllProduct() async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.producsUrl);

      if (response.statusCode == 200) {
        List<Product> productList = [];
        var data = await response.data;
        print(data);

        for (var i in data) {
          productList.add(Product.fromJson(i));
        }

        return productList;
      } else {
        throw "error";
      }
    } catch (error) {
      rethrow;
      
    }
  }


  Future deleteProduct(int id)async{
    try{
      dio.Response response = await BaseClient.delete(url: Urls.productDeleteUrl + id.toString());
      if(response.statusCode == 200){
        return response;
      }
      
    }catch(e){
      print(e);
    }
  }
}
