import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softic/app/modules/product_details/repository/add_product_repository.dart';
import 'package:dio/dio.dart' as dio;

import '../../../general/routes/app_routes.dart';

class AddProductController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          '${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';
    } else {
      Get.snackbar(
        'Error',
        'No Image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //addd product section
  TextEditingController nameController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController uniValueController = TextEditingController();
  TextEditingController pastQuantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController mrpController = TextEditingController();

  Future<void> addProduct() async {
    try {
      Map data = {
        "name": nameController.text,
        "barcode": barcodeController.text,
        "description": descriptionController.text,
        "image": selectedImagePath.value,
        "subCategory": int.parse(subCategoryController.text),
        "brand": int.parse(brandController.text),
        "quantity": {
          "quantity": int.parse(quantityController.text),
          "unit": unitController.text,
          "unitValue": int.parse(uniValueController.text),
          "pastQuantity": int.parse(pastQuantityController.text),
        },
        "productPrice": {
          "price": int.parse(priceController.text),
          "unitPrice": int.parse(unitPriceController.text),
          "mrp": int.parse(mrpController.text),
        },
      };
      dio.Response response =
          await AddProductRepository.addProduct(payload: data);
      if (response.statusCode == 201) {
        // var data = await response.data;
        // print("add productdata $data");

        nameController.clear();
        barcodeController.clear();
        descriptionController.clear();
        subCategoryController.clear();
        brandController.clear();
        unitController.clear();
        quantityController.clear();
        uniValueController.clear();
        unitPriceController.clear();
        priceController.clear();
        pastQuantityController.clear();
        mrpController.clear();

        Get.offAndToNamed(Routes.main);
      } else {
        throw " Add product error";
      }
    } catch (error) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) => SimpleDialog(
          title: Text("Error"),
          children: [Text(error.toString())],
        ),
      );
    }
  }
}
