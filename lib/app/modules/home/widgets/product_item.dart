import 'package:flutter/material.dart';
import 'package:softic/app/core/values/text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
              child: Image.network(
                'https://scontent.fdac27-1.fna.fbcdn.net/v/t39.30808-6/299657791_3219232444959410_4511597146871123200_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF4t7uEUKvsz1qrd2r4oOCgppzbAfqCzGSmnNsB-oLMZEhl6TPvuKpoD0nbZt8ACMpDd2OWmIW8jmJN_Z7_zgwZ&_nc_ohc=iXTElK7ernkAX97EETg&_nc_ht=scontent.fdac27-1.fna&oh=00_AfCq03FPL_w_nzBfKVuBHHJbK3ZJaVTG90JGggncyrya9g&oe=6438F8EC',
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
