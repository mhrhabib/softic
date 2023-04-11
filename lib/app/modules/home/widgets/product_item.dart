import 'package:flutter/material.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/modules/home/models/product.dart';

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
              child: Image.network( product.image ?? 'https://picsum.photos/200/300',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product name",
                style: titleTextStyle(),
              ),
              Text(
                "Brand Name",
                style: brandTextStyle(),
              ),
              Text(
                "Price : \$2000",
                style: priceTextStyle(),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_sweep,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
