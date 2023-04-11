import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/general/routes/app_routes.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';

import '../widgets/product_item.dart';

class HomPage extends StatelessWidget {
  HomPage({super.key});

  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: transparentAppBar(
          title: const Text("Products"),
          
        ),
        body: Obx(() {
          if(controller.products.contains("empty")){
            return Center(child:  Text("No data", style: titleTextStyle(),));
          }else{
            return RefreshIndicator(
              onRefresh: controller.updateList,
              child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.productDetails,
                              arguments: controller.products[index]);
                        },
                        child: ProductItem(
                          product: controller.products[index],
                        ));
                  },
                ),
            );
          }
        }),
    );
  }
}
