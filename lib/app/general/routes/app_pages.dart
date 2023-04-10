import 'package:get/get.dart';
import 'package:softic/app/modules/auth/sign_in/screens/sign_in_screen.dart';
import 'package:softic/app/modules/home/page/home_page.dart';
import 'package:softic/app/modules/main/main_screen.dart';
import 'package:softic/app/modules/product_details/screen/product_detail_screen.dart';
import 'package:softic/app/modules/profile/screen/profile_screen.dart';

import '../../modules/auth/sign_in/bindings/auth_bindings.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

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
      name: Routes.login,
      page: () => const SignInScreen(),
      binding: AuthBindings(),
    ),
  ];
}
