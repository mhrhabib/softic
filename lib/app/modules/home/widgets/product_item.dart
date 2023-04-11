import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';
import 'package:softic/app/modules/home/models/product.dart';
import 'package:softic/app/modules/home/widgets/preview_card_image.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .90,
      //foregroundDecoration: BoxDecoration(color: Colors.amber),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 7,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PreviewCardImage(url: product.image!, errorImage: const AssetImage('images/image.png'))
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *.45,
                child: Text(
                  product.name!,
                  style: titleTextStyle().copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                product.brand!.name!,
                style: brandTextStyle(),
              ),
              Text(
                product.productPrice!.price!.toString(),
                style: priceTextStyle(),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: IconButton(
              onPressed: () {
                Get.find<ProductController>().deleteProduct(product.id!);
                
                print("deleted");
              },
              icon: const Icon(
                Icons.delete_sweep,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
