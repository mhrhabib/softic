import 'package:get/get.dart';
import 'package:softic/app/modules/home/page/home_page.dart';
import 'package:softic/app/modules/main/main_screen.dart';
import 'package:softic/app/modules/product_details/screen/product_detail_screen.dart';
import 'package:softic/app/modules/profile/screen/profile_screen.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.main;

  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => const ProductDetailScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomPage(),
    ),
  ];
}
