import 'package:flutter/material.dart';
import 'package:softic/app/core/widgets/app_bar.dart';

import '../widgets/product_item.dart';

class HomPage extends StatelessWidget {
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
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
        return const ProductItem();
      },),
    );
  }
}
