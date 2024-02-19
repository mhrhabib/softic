import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/modules/home/controllers/product_controller.dart';
import 'package:softic/app/modules/home/widgets/preview_card_image.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});

  dynamic product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PreviewCardImage(url: product['image'], errorImage: const AssetImage('images/image.png'))
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *.45,
                child: Text(
                  product['name'],
                  style: titleTextStyle().copyWith(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                product['brand']['name'],
                style: brandTextStyle(). copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                product['productPrice']['price'].toString(),
                style: priceTextStyle().copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
          
          IconButton(
            onPressed: () async{
              Get.find<ProductController>().deleteProduct(product['id']);
              Get.find<ProductController>().products.removeWhere((element) => element['id']==product['id'],);
              
              print("deleted");
            },
            icon: const Icon(
              Icons.delete_sweep,
              size: 30,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
