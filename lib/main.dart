import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softic/app/general/routes/app_pages.dart';
import 'package:softic/app/general/routes/app_routes.dart';
import 'package:softic/app/modules/home/bindings/product_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ProductBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: storage.read('token') != null ? Routes.main : AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
