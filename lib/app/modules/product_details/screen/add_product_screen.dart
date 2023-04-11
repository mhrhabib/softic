import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';
import 'package:softic/app/modules/product_details/controllers/add_product_controller.dart';

class AddProdcutScreen extends StatelessWidget {
   AddProdcutScreen({super.key});

AddProductController controller = Get.put(AddProductController());
ProductController productController = Get.put( ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          title: Text(
        "Add Product",
        style: titleTextStyle(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  label: const Text('Name'),
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.barcodeController,
                decoration: InputDecoration(
                  label: const Text('Barcode'),
                  prefixIcon: const Icon(Icons.barcode_reader),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.descriptionController,
                decoration: InputDecoration(
                  label: const Text('Description'),
                  prefixIcon: const Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.subCategoryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('SubCategory'),
                  prefixIcon: const Icon(Icons.subdirectory_arrow_left),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.brandController,
                decoration: InputDecoration(
                  label: const Text('Brand'),
                  prefixIcon: const Icon(Icons.branding_watermark),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Quantity'),
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.unitController,
                decoration: InputDecoration(
                  label: const Text('Unit'),
                  prefixIcon: const Icon(Icons.ac_unit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.uniValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('UnitValue'),
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.pastQuantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('PastQuantity'),
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Price'),
                  prefixIcon: const Icon(Icons.money_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.unitPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('UnitPrice'),
                  prefixIcon: const Icon(Icons.money_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.mrpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('MRP'),
                  prefixIcon: const Icon(Icons.money_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Obx(() => controller.selectedImagePath.value == '' ? const Text("Select image from camera/galary") : SizedBox(
              height: 200,
              width: 200,
              child: Image.file(File(controller.selectedImagePath.value)),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  controller.getImage(ImageSource.camera);
      
                },
                label: const Text("Camera"),
              ),
            ),
            Padding(
              padding: const  EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              ),
            ),
            const SizedBox(height: 24),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  minimumSize: const Size(120, 40)
                ),
                onPressed: () async{
                  controller.addProduct();
                   await productController.updateList();
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
