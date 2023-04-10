import 'package:get/get.dart';
import 'package:softic/app/modules/home/page/home_page.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomPage(),
    ),
  ];
}
