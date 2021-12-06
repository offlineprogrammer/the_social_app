import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController to = Get.find();
  var selectedIndex = 0.obs;

  void onItemTapped(var index) {
    selectedIndex.value = index;
  }
}
