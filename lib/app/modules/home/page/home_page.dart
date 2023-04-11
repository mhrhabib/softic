import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';

import '../widgets/product_item.dart';

class HomPage extends GetWidget<ProductController> {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
        title: const Text("Products"),
        actions: [
          const Center(child:Text("Add Product")),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.productList.length,
        itemBuilder: (context, index) {
        return  ProductItem(product: controller.productList[index],);
      },),)
    );
  }
}
