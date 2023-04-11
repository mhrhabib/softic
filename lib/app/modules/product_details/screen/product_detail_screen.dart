import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/modules/home/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({
    super.key,
  });

  Product data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
        title: Text(
          data.name!,
          style: titleTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl: data.image!,
              imageBuilder: (context, imageProvider) => Container(
                
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width *0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width *0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                  image: const DecorationImage(
                    image: AssetImage("images/image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Brand: ${data.brand!.name!}',style: titleTextStyle(),),
                Text('Price: \$${data.productPrice!.price!}',style: titleTextStyle(),),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Row(
                children: [
                  Text("Product Barcode: ", style: brandTextStyle(),),
                  Text(data.barcode!, style: brandTextStyle(),),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Row(
                children: [
                  Text("Product Desciption: ", style: brandTextStyle(),),
                  
                ],
              ),
            ),
            SizedBox(child: Text(data.description!, style: brandTextStyle(),)),
          ],
        ),
      ),
    );
  }
}
