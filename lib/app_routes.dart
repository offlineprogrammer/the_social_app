import 'package:get/get.dart';

import 'controllers/bindings/controllers_bindings.dart';
import 'pages/home_page.dart';
import 'pages/sign_in_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: ControllersBindings(),
    ),
    GetPage(
      name: '/signin',
      page: () => SignInPage(),
      binding: ControllersBindings(),
    ),
  ];
}
