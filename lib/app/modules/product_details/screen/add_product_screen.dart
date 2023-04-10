import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddProdcutScreen extends StatefulWidget {
  const AddProdcutScreen({super.key});

  @override
  State<AddProdcutScreen> createState() => _AddProdcutScreenState();
}

class _AddProdcutScreenState extends State<AddProdcutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Colors.amber,
    );
  }
}