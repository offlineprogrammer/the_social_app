import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/navigation_controller.dart';

class BottomBar extends GetWidget<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: 'Search',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: 'Share',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.notifications_sharp),
            //   label: 'Updates',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          backgroundColor: Color.fromRGBO(18, 52, 86, 1.0),
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.white,
          onTap: controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
