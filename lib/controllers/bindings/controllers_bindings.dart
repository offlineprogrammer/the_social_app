import 'package:get/get.dart';
import 'package:the_social_app/controllers/feed_controller.dart';

import '../auth_controller.dart';
import '../navigation_controller.dart';
import '../post_controller.dart';
import '../user_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
//     Get.put<AuthController>(AuthController(), permanent: true);
//     Get.put<UserController>(UserController(), permanent: true);
//     Get.put<NavigationController>(NavigationController(), permanent: true);
// Get.put<PostController>(PostController(), permanent: true);
// Get.put<FeedController>(FeedController(), permanent: true);

    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<FeedController>(() => FeedController());
  }
}
