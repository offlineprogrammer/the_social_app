import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_social_app/controllers/navigation_controller.dart';
import 'package:the_social_app/controllers/user_controller.dart';
import 'package:the_social_app/widgets/bottom_bar.dart';
import 'package:the_social_app/widgets/create_post.dart';
import 'package:the_social_app/widgets/feed_list.dart';
import 'package:the_social_app/widgets/home_drawer.dart';
import 'package:the_social_app/widgets/user_profile.dart';

class HomePage extends GetWidget<UserController> {
  NavigationController _navigationController = Get.find();

  get kTransparentImage => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffE1E5E4),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomBar(),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Obx(
              () => Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //model.pageWidget,
                  [
                    FeedList(),
                    CreatePost(),
                    UserProfile(),
                  ].elementAt(_navigationController.selectedIndex.value),
                ],
              ),
            )));
  }
}
